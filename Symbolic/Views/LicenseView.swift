// Copyright (c) 2022-2023 InSeven Limited
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import SwiftUI

import Diligence

struct LicenseView: View {

    private struct LayoutMetrics {
        static let width = 400.0
        static let height = 500.0
    }

    var license: License

    public init(license: License) {
        self.license = license
    }

    public var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Author")
                    Spacer()
                    Text(license.author)
                        .foregroundColor(.secondary)
                }
                Divider()
                Text(license.text)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Spacer()
                    Button("Copy") {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(license.text, forType: .string)
                    }
                }
                .padding()
            }
            .background(Color.textBackgroundColor)
        }
        .background(Color.textBackgroundColor)
        .navigationTitle(license.name)
        .frame(width: LayoutMetrics.width, height: LayoutMetrics.height)
        .foregroundColor(.primary)
    }

}
