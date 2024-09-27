//
//  ModelData.swift
//  Landmarks
//
//  Created by 小林達弥 on 2024/09/25.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldon't find \(fileName) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldon't find \(fileName) in main bundle: \n\(error)")
        }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }    catch {
        fatalError("Couldon't parse \(fileName) as: \(T.self):\n\(error)")
    }
}
