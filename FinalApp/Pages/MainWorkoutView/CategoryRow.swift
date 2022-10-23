//
//  TypeRow.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/17/22.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [workout]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            //the scrollview showing each workout cell 
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { workout in
                        NavigationLink {
                            CategoryDetail(workout: workout)
                        } label: {
                            CategoryItem(workout: workout)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct TypeRow_Previews: PreviewProvider {
    
    static var workouts = ModelData().workouts
    
    static var previews: some View {
        CategoryRow(
            categoryName: workouts[0].category.rawValue,
            items: Array(workouts.prefix(3))
        )
    }
}
