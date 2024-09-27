//
//  FeatureCard.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/27.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct TextOverlay: View {
    let landmark: Landmark
    
    // 縁の下部にかかるグラデーション
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading, content: {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            })
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(landmark: ModelData().features[1])
        .aspectRatio(3 / 2, contentMode: .fit)
}
