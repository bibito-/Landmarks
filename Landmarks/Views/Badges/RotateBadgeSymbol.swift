//
//  RotateBadgeSymbol.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/26.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol().padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    return RotateBadgeSymbol(angle: Angle(degrees: 5))
}
