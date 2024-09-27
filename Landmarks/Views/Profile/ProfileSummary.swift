//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/26.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seadonal photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Completed Badge")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBudge(name: "First Hike")
                            HikeBudge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBudge(name: "Teneh Hike")
                                .grayscale(0.50)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding()
                    }
                })
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                })
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
