//
//  CompletedWorkouts.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/27/22.
//

import Foundation
/*
struct finishedWorkout: Identifiable {
    var id: Int
    var type: String
    var duration: Int
    var description: String
    var imageName: String
    var isFeatured: Bool
}
*/
class CompletedWorkout: ObservableObject {
    @Published var completedworkouts = [workout]()

    func add(item: workout) {
        completedworkouts.append(item)
    }
}

