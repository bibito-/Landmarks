//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/25.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLnadmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                
                ForEach(filteredLnadmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLnadmarks)
            .navigationTitle("Landmarks")
            } detail: {
                Text("Select Randmark")
            }
        }
}

#Preview {
    return LandmarkList()
        .environment(ModelData())
}
