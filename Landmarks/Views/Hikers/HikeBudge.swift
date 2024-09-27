//
//  HikeBudge.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/26.
//

import SwiftUI

struct HikeBudge: View {
    var name:String
    var body: some View {
        VStack {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")
        }
    }
}

#Preview {
    HikeBudge(name: "Preview Testing")
}
