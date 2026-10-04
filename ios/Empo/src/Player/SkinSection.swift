import GameProbe
import PhotosUI
import SwiftUI
import UniformTypeIdentifiers

/// The profile editor's skin sheet: art per orientation and the
/// outlines switch. Everything writes straight to the profile folder.
struct SkinSheet: View {
    let profileName: String
    /// Called after any change, so the editor canvas redraws.
    let onChange: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var showOutlines = false

    var body: some View {
        NavigationStack {
            Form {
                SkinSection(profileName: profileName, orientation: .portrait, onChange: onChange)
                SkinSection(profileName: profileName, orientation: .landscape, onChange: onChange)
                Section {
                    Toggle("Show button outlines", isOn: $showOutlines)
                        .onChange(of: showOutlines) { _, new in
                            saveOutlines(new)
                        }
                } footer: {
                    Text(
                        "Off: the art's painted buttons are the buttons, and Empo's controls only take touches. Edit mode always shows them."
                    )
                }
            }
            .navigationTitle("Skin")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
        .onAppear {
            showOutlines =
                LayoutProfilesManager.skinSettings(profile: profileName)
                .showButtonOutlines
        }
    }

    private func saveOutlines(_ value: Bool) {
        let folder = LayoutProfilesManager.store.profileURL(profileName)
        try? SkinFiles.writeSettings(SkinSettings(showButtonOutlines: value), profileFolder: folder)
        LayoutProfilesManager.postProfileChange(name: profileName, from: nil)
        onChange()
    }
}

/// One orientation's art: add from Photos or Files, replace, remove.
struct SkinSection: View {
    let profileName: String
    let orientation: SkinOrientation
    var onChange: () -> Void = {}

    @State private var photoItem: PhotosPickerItem?
    @State private var showFileImporter = false
    @State private var showPhotoPicker = false
    @State private var showError = false
    @State private var revision = 0

    private var title: String {
        orientation == .portrait ? "Portrait art" : "Landscape art"
    }

    private var art: UIImage? {
        _ = revision
        return LayoutProfilesManager.skinArt(
            profile: profileName, orientation: orientation, maxPixel: 400)
    }

    var body: some View {
        Section(title) {
            if let art {
                Image(uiImage: art)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 160)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Menu(art == nil ? "Add image" : "Replace image") {
                Button {
                    showPhotoPicker = true
                } label: {
                    Label("Photos", systemImage: "photo")
                }
                Button {
                    showFileImporter = true
                } label: {
                    Label("Files", systemImage: "folder")
                }
            }
            if art != nil {
                Button("Remove image", role: .destructive, action: remove)
            }
        }
        .photosPicker(isPresented: $showPhotoPicker, selection: $photoItem, matching: .images)
        .onChange(of: photoItem) { _, item in
            guard let item else { return }
            photoItem = nil
            Task { await importPhoto(item) }
        }
        .fileImporter(
            isPresented: $showFileImporter, allowedContentTypes: [.png, .jpeg, .image]
        ) { result in
            if case .success(let url) = result {
                importFile(url)
            }
        }
        .alert("Couldn't use that image", isPresented: $showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("The skin art is unchanged. Try a PNG or JPEG image.")
        }
    }

    private func importPhoto(_ item: PhotosPickerItem) async {
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            showError = true
            return
        }
        let ext = item.supportedContentTypes.first?.preferredFilenameExtension
        install(data, fileExtension: ext)
    }

    private func importFile(_ url: URL) {
        let scoped = url.startAccessingSecurityScopedResource()
        defer {
            if scoped { url.stopAccessingSecurityScopedResource() }
        }
        guard let data = try? Data(contentsOf: url) else {
            showError = true
            return
        }
        install(data, fileExtension: url.pathExtension)
    }

    /// PNG and JPEG keep their bytes. Anything else that decodes (HEIC
    /// from Photos, for example) is re-encoded as JPEG.
    private func install(_ data: Data, fileExtension: String?) {
        guard let decoded = UIImage(data: data) else {
            showError = true
            return
        }
        let ext = fileExtension?.lowercased() ?? ""
        let folder = LayoutProfilesManager.store.profileURL(profileName)
        do {
            if SkinFiles.extensions.contains(ext) {
                try SkinFiles.installArt(
                    data, fileExtension: ext, orientation: orientation, profileFolder: folder)
            } else if let jpeg = decoded.jpegData(compressionQuality: 0.9) {
                try SkinFiles.installArt(
                    jpeg, fileExtension: "jpg", orientation: orientation, profileFolder: folder)
            } else {
                showError = true
                return
            }
        } catch {
            showError = true
            return
        }
        changed()
    }

    private func remove() {
        let folder = LayoutProfilesManager.store.profileURL(profileName)
        try? SkinFiles.removeArt(orientation: orientation, profileFolder: folder)
        changed()
    }

    private func changed() {
        SkinArtCache.shared.invalidate(profile: profileName)
        LayoutProfilesManager.postProfileChange(name: profileName, from: nil)
        revision += 1
        onChange()
    }
}

/// A small art preview for the profile lists. Portrait art first,
/// landscape as the fallback, nothing without art.
struct SkinThumbnail: View {
    let profileName: String

    var body: some View {
        if let image = LayoutProfilesManager.skinArt(
            profile: profileName, orientation: .portrait, maxPixel: 132)
            ?? LayoutProfilesManager.skinArt(
                profile: profileName, orientation: .landscape, maxPixel: 132)
        {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .accessibilityHidden(true)
        }
    }
}
