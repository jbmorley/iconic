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

import Combine
import SwiftUI

import Interact

struct ContentView: View {

    @EnvironmentObject var document: IconDocument

    @StateObject var sceneModel = SceneModel()

    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                VStack {
                    ForEach(ApplicationModel.icons) { section in
                        Header(section.name)
                        CenteredFlowLayout {
                            ForEach(section.sets) { iconSet in
                                IconSetView(sceneModel: sceneModel, icon: document.icon, iconSet: iconSet)
                                    .padding()
                            }
                        }
                        .padding()
                    }
                }
                .padding()
            }
            .background(Color(nsColor: .textBackgroundColor))
            .frame(maxWidth: .infinity, minHeight: 400)
            .cacheVectorGraphics(true)
            Divider()
            EditorView(sceneModel: sceneModel, document: document)
                .frame(width: 300)
        }
        .focusedSceneObject(document)
        .focusedSceneObject(sceneModel)
        .toolbar(id: "main") {
            ToolbarItem(id: "grid") {
                Toggle(isOn: $sceneModel.showGrid) {
                    Label("Grid", systemImage: "grid")
                }
                .help("Hide/show the icon grid")
            }
            ExportToolbar(icon: document.icon)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
