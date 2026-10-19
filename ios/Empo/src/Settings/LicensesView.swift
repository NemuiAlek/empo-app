// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Mateo M. Additional terms apply: see ADDITIONAL-TERMS.md.

import SwiftUI

struct LicensesView: View {
    var body: some View {
        List(licenses) { license in
            NavigationLink {
                ScrollView {
                    Text(license.text)
                        .font(.caption)
                        .monospaced()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .textSelection(.enabled)
                }
                .navigationTitle(license.name)
                .navigationBarTitleDisplayMode(.inline)
            } label: {
                VStack(alignment: .leading, spacing: Spacing.xs) {
                    Text(license.name)
                    Text(license.license)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Open-source licenses")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct LicenseEntry: Identifiable {
    let id: String
    let name: String
    let license: String
    let text: String

    init(_ name: String, license: String, text: String) {
        self.id = name
        self.name = name
        self.license = license
        self.text = text
    }
}

// Keep entries alphabetical.
private let licenses: [LicenseEntry] = [
    LicenseEntry(
        "ANGLE", license: "BSD 3-Clause",
        text: """
            Copyright 2018 The ANGLE Project Authors. All rights reserved.

            Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

            1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

            2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

            3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
            """),

    LicenseEntry(
        "Empo", license: "GPL-3.0 with additional terms",
        text: """
            Empo, Copyright (C) 2026 Mateo M., https://github.com/mateo-m/empo-app
            mkxp-z-apple-mobile, Copyright (C) 2026 Mateo M., https://github.com/mateo-m/mkxp-z-apple-mobile
            psdk-apple-mobile, Copyright (C) 2026 Mateo M., https://github.com/mateo-m/psdk-apple-mobile
            mvmz-apple-mobile, Copyright (C) 2026 Mateo M., https://github.com/mateo-m/mvmz-apple-mobile

            This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3, with the additional terms that section 7 of that license permits.

            This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

            The full license is at https://www.gnu.org/licenses/gpl-3.0.html and in the LICENSE file of the source code. The additional terms are in the ADDITIONAL-TERMS.md file of the source code. In short: keep this notice, do not present this program as the work of another person, and give a modified version its own name and icon.

            The name "Empo", the Empo logo, and the Empo icon are not under the GPL.
            """),

    LicenseEntry(
        "FLAC", license: "BSD 3-Clause",
        text: """
            Copyright (C) 2000-2009  Josh Coalson
            Copyright (C) 2011-2023  Xiph.Org Foundation

            Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

            - Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

            - Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

            - Neither the name of the Xiph.Org Foundation nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
            """),

    LicenseEntry(
        "FreeType", license: "FreeType License (FTL)",
        text: """
            Copyright (C) 2006-2023 by David Turner, Robert Wilhelm, and Werner Lemberg.

            This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.

            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.

            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "json5pp", license: "MIT",
        text: """
            Copyright (c) 2019 Shuta Kimura

            Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

            The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
            """),

    LicenseEntry(
        "libarchive", license: "BSD 2-Clause",
        text: """
            Copyright (c) 2003-2018 Tim Kientzle. All rights reserved.

            Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

            1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

            2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

            THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
            """),

    LicenseEntry(
        "libmspack", license: "LGPL 2.1",
        text: """
            Copyright (C) 2003-2023 Stuart Caie.

            libmspack is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License (LGPL) version 2.1, as published by the Free Software Foundation.

            This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

            You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA. The full license text is also available at https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html and ships with the source at ios/Empo/vendor/libmspack/COPYING.LIB.
            """),

    LicenseEntry(
        "libogg", license: "BSD 3-Clause",
        text: """
            Copyright (c) 2002, Xiph.org Foundation

            Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

            1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

            2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

            3. Neither the name of the Xiph.org Foundation nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
            """),

    LicenseEntry(
        "libpng", license: "libpng License",
        text: """
            Copyright (c) 1998-2023 Glenn Randers-Pehrson

            This code is released under the libpng license. For conditions of distribution and use, see the disclaimer and license in png.h.

            The PNG Reference Library is supplied "AS IS". The Contributing Authors and Group 42, Inc. disclaim all warranties, expressed or implied, including, without limitation, the warranties of merchantability and of fitness for any particular purpose. The Contributing Authors and Group 42, Inc. assume no liability for direct, indirect, incidental, special, exemplary, or consequential damages, which may result from the use of the PNG Reference Library, even if advised of the possibility of such damage.
            """),

    LicenseEntry(
        "libtheora", license: "BSD 3-Clause",
        text: """
            Copyright (C) 2002-2009 Xiph.org Foundation

            Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

            1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

            2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

            3. Neither the name of the Xiph.org Foundation nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
            """),

    LicenseEntry(
        "libvorbis", license: "BSD 3-Clause",
        text: """
            Copyright (c) 2002-2020 Xiph.org Foundation

            Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

            1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

            2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

            3. Neither the name of the Xiph.org Foundation nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
            """),

    LicenseEntry(
        "libyaml", license: "MIT",
        text: """
            Copyright (c) 2017-2020 Ingy döt Net
            Copyright (c) 2006-2016 Kirill Simonov

            Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

            The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
            """),

    LicenseEntry(
        "LiteCGSS", license: "No license file",
        text: """
            LiteCGSS by Nuri Yuri and contributors.
            https://gitlab.com/NuriYuri/litecgss

            The LiteCGSS project publishes no license file.
            """),

    LicenseEntry(
        "LiteRGSS2", license: "No license file",
        text: """
            LiteRGSS2 by Nuri Yuri, Scorbutics, and contributors.
            https://gitlab.com/pokemonsdk/litergss2

            The LiteRGSS2 project publishes no license file.
            """),

    LicenseEntry(
        "mkxp-z", license: "GPL-2.0",
        text: """
            mkxp-z - RGSS player for multiple platforms
            Copyright (C) 2020-2024 Splendide Imaginarius and contributors
            Copyright (C) 2013-2023 Jonas Kulla and contributors

            This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

            This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

            You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
            """),

    LicenseEntry(
        "OpenAL Soft", license: "LGPL 2.0 or later",
        text: """
            OpenAL cross platform audio library
            Copyright (C) 1999-2007 by authors.
            https://github.com/kcat/openal-soft

            This library is free software; you can redistribute it and/or modify it under the terms of the GNU Library General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

            This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License for more details.

            You should have received a copy of the GNU Library General Public License along with this library; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA. The full license text is also available at https://www.gnu.org/licenses/old-licenses/lgpl-2.0.html.
            """),

    LicenseEntry(
        "OpenSSL", license: "Apache License 2.0",
        text: """
            Copyright (c) 1998-2026 The OpenSSL Project Authors
            Copyright (c) 1995-1998 Eric A. Young, Tim J. Hudson
            All rights reserved.

            Apache License Version 2.0, January 2004 https://www.apache.org/licenses/

            TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

            1. Definitions.

            "License" shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document.

            "Licensor" shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.

            "Legal Entity" shall mean the union of the acting entity and all other entities that control, are controlled by, or are under common control with that entity. For the purposes of this definition, "control" means (i) the power, direct or indirect, to cause the direction or management of such entity, whether by contract or otherwise, or (ii) ownership of fifty percent (50%) or more of the outstanding shares, or (iii) beneficial ownership of such entity.

            "You" (or "Your") shall mean an individual or Legal Entity exercising permissions granted by this License.

            "Source" form shall mean the preferred form for making modifications, including but not limited to software source code, documentation source, and configuration files.

            "Object" form shall mean any form resulting from mechanical transformation or translation of a Source form, including but not limited to compiled object code, generated documentation, and conversions to other media types.

            "Work" shall mean the work of authorship, whether in Source or Object form, made available under the License, as indicated by a copyright notice that is included in or attached to the work (an example is provided in the Appendix below).

            "Derivative Works" shall mean any work, whether in Source or Object form, that is based on (or derived from) the Work and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship. For the purposes of this License, Derivative Works shall not include works that remain separable from, or merely link (or bind by name) to the interfaces of, the Work and Derivative Works thereof.

            "Contribution" shall mean any work of authorship, including the original version of the Work and any modifications or additions to that Work or Derivative Works thereof, that is intentionally submitted to Licensor for inclusion in the Work by the copyright owner or by an individual or Legal Entity authorized to submit on behalf of the copyright owner. For the purposes of this definition, "submitted" means any form of electronic, verbal, or written communication sent to the Licensor or its representatives, including but not limited to communication on electronic mailing lists, source code control systems, and issue tracking systems that are managed by, or on behalf of, the Licensor for the purpose of discussing and improving the Work, but excluding communication that is conspicuously marked or otherwise designated in writing by the copyright owner as "Not a Contribution."

            "Contributor" shall mean Licensor and any individual or Legal Entity on behalf of whom a Contribution has been received by Licensor and subsequently incorporated within the Work.

            2. Grant of Copyright License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute the Work and such Derivative Works in Source or Object form.

            3. Grant of Patent License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable (except as stated in this section) patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the Work, where such license applies only to those patent claims licensable by such Contributor that are necessarily infringed by their Contribution(s) alone or by combination of their Contribution(s) with the Work to which such Contribution(s) was submitted. If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Work or a Contribution incorporated within the Work constitutes direct or contributory patent infringement, then any patent licenses granted to You under this License for that Work shall terminate as of the date such litigation is filed.

            4. Redistribution. You may reproduce and distribute copies of the Work or Derivative Works thereof in any medium, with or without modifications, and in Source or Object form, provided that You meet the following conditions:

            (a) You must give any other recipients of the Work or Derivative Works a copy of this License; and

            (b) You must cause any modified files to carry prominent notices stating that You changed the files; and

            (c) You must retain, in the Source form of any Derivative Works that You distribute, all copyright, patent, trademark, and attribution notices from the Source form of the Work, excluding those notices that do not pertain to any part of the Derivative Works; and

            (d) If the Work includes a "NOTICE" text file as part of its distribution, then any Derivative Works that You distribute must include a readable copy of the attribution notices contained within such NOTICE file, excluding those notices that do not pertain to any part of the Derivative Works, in at least one of the following places: within a NOTICE text file distributed as part of the Derivative Works; within the Source form or documentation, if provided along with the Derivative Works; or, within a display generated by the Derivative Works, if and wherever such third-party notices normally appear. The contents of the NOTICE file are for informational purposes only and do not modify the License. You may add Your own attribution notices within Derivative Works that You distribute, alongside or as an addendum to the NOTICE text from the Work, provided that such additional attribution notices cannot be construed as modifying the License.

            You may add Your own copyright statement to Your modifications and may provide additional or different license terms and conditions for use, reproduction, or distribution of Your modifications, or for any such Derivative Works as a whole, provided Your use, reproduction, and distribution of the Work otherwise complies with the conditions stated in this License.

            5. Submission of Contributions. Unless You explicitly state otherwise, any Contribution intentionally submitted for inclusion in the Work by You to the Licensor shall be under the terms and conditions of this License, without any additional terms or conditions. Notwithstanding the above, nothing herein shall supersede or modify the terms of any separate license agreement you may have executed with Licensor regarding such Contributions.

            6. Trademarks. This License does not grant permission to use the trade names, trademarks, service marks, or product names of the Licensor, except as required for reasonable and customary use in describing the origin of the Work and reproducing the content of the NOTICE file.

            7. Disclaimer of Warranty. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.

            8. Limitation of Liability. In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.

            9. Accepting Warranty or Additional Liability. While redistributing the Work or Derivative Works thereof, You may choose to offer, and charge a fee for, acceptance of support, warranty, indemnity, or other liability obligations and/or rights consistent with this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor, and only if You agree to indemnify, defend, and hold each Contributor harmless for any liability incurred by, or claims asserted against, such Contributor by reason of your accepting any such warranty or additional liability.

            END OF TERMS AND CONDITIONS
            """),

    LicenseEntry(
        "PhysicsFS", license: "zlib License",
        text: """
            Copyright (c) 2001-2022 Ryan C. Gordon and contributors.

            This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.

            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.

            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "pixman", license: "MIT",
        text: """
            Copyright 1987, 1988, 1989, 1998 The Open Group
            Copyright 1987, 1988, 1989 Digital Equipment Corporation
            Copyright 1999, 2004, 2008 Keith Packard
            Copyright 2000 SuSE, Inc.
            Copyright 2000 Keith Packard, member of The XFree86 Project, Inc.
            Copyright 2004, 2005, 2007, 2008, 2009, 2010 Red Hat, Inc.
            Copyright 2004 Nicholas Miell
            Copyright 2005 Lars Knoll & Zack Rusin, Trolltech
            Copyright 2005 Trolltech AS
            Copyright 2007 Luca Barbato
            Copyright 2008 Aaron Plattner, NVIDIA Corporation
            Copyright 2008 Rodrigo Kumpera
            Copyright 2008 Andre Tupinamba
            Copyright 2008 Mozilla Corporation
            Copyright 2008, 2009, 2010 Nokia Corporation
            Copyright 2009, 2010 Jeff Muizelaar
            Copyright 2009, 2010 Siarhei Siamashka
            Copyright 2009 Mans Rullgard
            Copyright 2011 Samsung Electronics

            Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

            The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
            """),

    LicenseEntry(
        "Ruby", license: "Ruby License / BSD 2-Clause",
        text: """
            Ruby is copyrighted free software by Yukihiro Matsumoto <matz@netlab.jp>.

            You can redistribute it and/or modify it under either the terms of the 2-clause BSDL (see the file BSDL), or the conditions below:

            1. You may make and give away verbatim copies of the source form of the software without restriction, provided that you duplicate all of the original copyright notices and associated disclaimers.

            2. You may modify your copy of the software in any way, provided that you do at least ONE of the following:

               a) place your modifications in the Public Domain or otherwise make them Freely Available, such as by posting said modifications to Usenet or an equivalent medium, or by allowing the author to include your modifications in the software.

               b) use the modified software only within your corporation or organization.

               c) give non-standard binaries non-standard names, with instructions on where to get the original software distribution.

               d) make other distribution arrangements with the author.
            """),

    LicenseEntry(
        "Smallbits icon pack", license: "Smallbits License (free for commercial use)",
        text: """
            Smallbits - 200+ pixelated icons on an 8x8 grid.
            Designed by Minor Adventures (Amsterdam, Netherlands).
            https://smallbits.design

            Used by the splash background's panning pattern. The icons are free for personal and commercial use. The license forbids repackaging them for resale, such as icon marketplaces or UI kits where the icons are the main draw. Empo shows only a small set of shapes: circle, square, diamond, heart, star, plus, cube, and sphere. The full pack ships in `Assets.bundle/SplashIcons/` for later use.

            Smallbits License Agreement (TL;DR):
              "Smallbits is free. Use the icons in personal or commercial projects, modify them however you like, include them in client work and end products. Just don't repackage the icons to sell them as icons - no uploading to marketplaces, no bundling them into UI kits or themes where the icons are the main event, no reselling the files."

            Full terms at https://smallbits.design/license.
            """),

    LicenseEntry(
        "SDL2", license: "zlib License",
        text: """
            Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>

            This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.

            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.

            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "SDL2_image", license: "zlib License",
        text: """
            Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>

            This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.

            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.

            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "SDL2_sound", license: "zlib License",
        text: """
            Copyright (C) 2001-2024 Ryan C. Gordon <icculus@icculus.org>

            This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.

            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.

            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "SDL2_ttf", license: "zlib License",
        text: """
            Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>

            This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.

            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.

            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "SFML", license: "zlib License",
        text: """
            SFML - Copyright (C) 2007-2023 Laurent Gomila - laurent@sfml-dev.org

            This software is provided 'as-is', without any express or implied warranty. In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software.  If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "theoraplay", license: "zlib License",
        text: """
            Copyright (c) 2011-2021 Ryan C. Gordon <icculus@icculus.org>.

            This software is provided 'as-is', without any express or implied warranty.  In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
            3. This notice may not be removed or altered from any source distribution.
            """),

    LicenseEntry(
        "uchardet", license: "MPL 1.1 / GPL 2.0 / LGPL 2.1",
        text: """
            Copyright (C) 2006 via BYTEmark International

            The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.mozilla.org/MPL/

            Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for the specific language governing rights and limitations under the License.

            Alternatively, the contents of this file may be used under the terms of either the GNU General Public License Version 2 or later (the "GPL"), or the GNU Lesser General Public License Version 2.1 or later (the "LGPL"), in which case the provisions of the GPL or the LGPL are applicable instead of those above.
            """),

    LicenseEntry(
        "zlib", license: "zlib License",
        text: """
            (C) 1995-2022 Jean-loup Gailly and Mark Adler

            This software is provided 'as-is', without any express or implied warranty.  In no event will the authors be held liable for any damages arising from the use of this software.

            Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:

            1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
            2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
            3. This notice may not be removed or altered from any source distribution.

            Jean-loup Gailly  Mark Adler
            jloup@gzip.org  madler@alumni.caltech.edu
            """),
]
