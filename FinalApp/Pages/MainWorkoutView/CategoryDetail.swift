//
//  CategoryDetail.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/29/22.
//

import SwiftUI
var words = [String]()

//variable to put workout.goalNum into the goals tab
var goalNUM = 0

struct CategoryDetail: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var dones: CompletedWorkout
    
    @State private var isShowPopup: Bool = false
    @State private var word: String = ""
    var workout: workout
    
    var workoutIndex: Int {
        modelData.workouts.firstIndex(where: { $0.id == workout.id})!
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).opacity(0.4)
            ScrollView(.vertical) {
                VStack {
                    Image(workout.imageName)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 300)
                        .clipped()
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                    Spacer()
                }
                Spacer()
                    .frame(height: 30)
                    HStack {
                            Text(workout.category.rawValue)
                                .bold()
                                .padding([.leading])
                                .padding(.bottom, 1)
                                .font(.title)
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(workout.duration) minutes")
                            .font(.system(size: 20))
                            .padding(.leading)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    HStack {
                        Text(workout.description)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 1)
                            .padding(.leading)
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 50)
                HStack {
                    Text("Descriptors")
                        .bold()
                        .font(.system(size: 25))
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    Text("What word would best describe how you are feeling after completing this activity?")
                        .multilineTextAlignment(.leading)
                        .padding(.top, 1)
                }
                TextField("Adjectives", text: $word)
                    .padding()
                    .background(.white)
                    .cornerRadius(50)
                    .padding(.bottom, 50)
                    .frame(width: 405)
                
                Button {
                    goalNUM = workout.goalNum
                        dones.add(item: workout)
                    words.append(word)
                        isShowPopup.toggle()
                        print(dones)
                        //increases identifier by 1 so that each finished workout has a unique value to it
                } label: {
                        Text("Log Workout")
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                    }.buttonStyle(NiceButtonStyle())

                }
                .ignoresSafeArea(.all)
            RatePopUp(show: $isShowPopup)
            }
        }
    }


struct CategoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetail(workout: ModelData().workouts[0])
            .environmentObject(CompletedWorkout())
            .environmentObject(ModelData())
    }
}
