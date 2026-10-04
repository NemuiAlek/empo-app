import ImageIO
import UIKit

/// Decoded profile skin art, keyed by file URL.
///
/// Art can be a full-resolution photo, so images decode through
/// ImageIO's thumbnailer at the size the screen can show, never at
/// file size. Any profile change empties the cache: art changes are
/// rare and the next draw reloads only what is on screen.
@MainActor
final class SkinArtCache {
    static let shared = SkinArtCache()

    /// Keyed by size too: a list thumbnail must not hand its tiny
    /// decode to the full-screen player.
    private struct Key: Hashable {
        let url: URL
        let maxPixel: Int
    }

    private var images: [Key: UIImage] = [:]
    private var token: NSObjectProtocol?

    init() {
        token = NotificationCenter.default.addObserver(
            forName: .layoutProfileDidChange, object: nil, queue: .main
        ) { [weak self] note in
            let name = note.userInfo?["name"] as? String ?? ""
            MainActor.assumeIsolated {
                self?.invalidate(profile: name)
            }
        }
    }

    /// nil when the file is missing or does not decode as an image.
    func image(at url: URL, maxPixel: CGFloat) -> UIImage? {
        let key = Key(url: url, maxPixel: Int(maxPixel.rounded()))
        if let hit = images[key] { return hit }
        let sourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let source = CGImageSourceCreateWithURL(url as CFURL, sourceOptions) else {
            return nil
        }
        let thumbnailOptions =
            [
                kCGImageSourceCreateThumbnailFromImageAlways: true,
                kCGImageSourceCreateThumbnailWithTransform: true,
                kCGImageSourceShouldCacheImmediately: true,
                kCGImageSourceThumbnailMaxPixelSize: max(1, maxPixel),
            ] as CFDictionary
        guard let cgImage = CGImageSourceCreateThumbnailAtIndex(source, 0, thumbnailOptions)
        else { return nil }
        let image = UIImage(cgImage: cgImage)
        images[key] = image
        return image
    }

    /// Drops every entry. Takes the profile name so callers say what
    /// changed, even though clearing everything is simpler and cheap.
    func invalidate(profile _: String) {
        images.removeAll()
    }
}
