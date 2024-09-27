//
//  Badge.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/26.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0 ..< 8) { index in
            RotateBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
            
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack(content: {
            BadgeBackgrount()
            GeometryReader { geometory in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometory.size.width / 2.0, y:(3.0 / 4.0) * geometory.size.height)
            }
            .scaledToFit()
            
        })
    }
}

#Preview {
    Badge()
}
