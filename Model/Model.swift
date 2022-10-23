//
//  Model.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/18/22.
//

import Foundation

struct workout: Hashable, Codable, Identifiable {
    
    var category: Category
    var isFeatured: Bool
    var imageName: String
    var id: String
    var goalNum: Int
    var duration: Int
    var description: String
    
    enum Category: String, CaseIterable, Codable {
        case meditation = "Meditation"
        case biking = "Biking"
        case walking = "Walking"
        case yoga = "Yoga"
        case running = "Running"
        case swimming = "Swimming"
        case stretching = "Stretching"
        case strength = "Strength Training"
        case climbing = "Climbing"
        case gardening = "Gardening"
        case dancing = "Dancing"
    }
    var rating: Int
    mutating func toggleFeature() {
        isFeatured.toggle()
    }
    
}

/*
struct finishedWorkout: Hashable {
    var category: String
    var: Int
    var imageName: String
}
*/

final class ModelData: ObservableObject {
    @Published var workouts: [workout] = load("data.json")
    var features : [workout] {
        workouts.filter { $0.isFeatured }
    }
    var categories : [String: [workout]] {
        Dictionary(
            grouping: workouts,
            by: { $0.category.rawValue}
        )
    }
}
/*
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project")
        }
        
        return loadedData
    }
}
*/

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
