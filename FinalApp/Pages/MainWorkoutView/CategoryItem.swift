//
//  CategoryItem.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/26/22.
//

import SwiftUI

struct CategoryItem: View {
    
    var workout: workout
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(workout.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .clipped()
            Text(String(workout.duration)+" mins")
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(workout: ModelData().workouts[0])
    }
}
