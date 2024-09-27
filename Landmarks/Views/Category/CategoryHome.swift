//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/26.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Futured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environment(modelData)
            })
        } detail: {
            Text("Select Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
