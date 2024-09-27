//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
