//
//  GoalsView.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/17/22.
//

//if achievement completed show this view variable conditional

var achieveName: String = ""
var achieveNum: Int = 0

import SwiftUI
import SwiftUICharts
struct GoalsView: View {
    @State var showing: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).opacity(0.4)
            ScrollView (.vertical) {
                VStack {
                    Image("achievement")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .padding()
                    Text("Achievements!")
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(Color("AccentColor"))
                    ForEach(indices, id:\.self) { number in
                        achievement(index: number)
                    }
                    achievement(index: 1)
                    Spacer()
                }
            }
           
            ForEach(indices, id:\.self) { num in
                if(goals[num] == amounts[num]) {
                    proxy {
                        print("proxy running")
                        achieveName = names[num]
                        achieveNum = amounts[num]
                        showing.toggle()
                    }
                }
            }
            AchievementPopup(achieveShow: $showing, workoutName: achieveName, number: achieveNum)
            
        }
    }
}

//dumb workaround
struct proxy : View {
    init( _ doCode: () -> () ) {
        doCode()
    }
    var body: some View {
        return EmptyView()
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
//data management
var indices = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var names = ["Sprinter", "Wayfarer", "Globetrotter", "Mountaineer", "Green Thumb", "Yoga Master", "Aquanaut", "Enthusiast", "Motivated", "Regular", "Tranquility"]
var explanations = ["Run 10 times", "Bike 10 times", "Walk 10 times", "Climb 10 times", "Garden 10 times", "Complete 10 yoga exercises", "Swim 10 times", "Complete 10 activities", "Complete 50 activities", "Complete 100 activities", "Meditate 10 times"]
var goals = [10, 10, 10, 10, 10, 10, 10, 10, 50, 100, 10]
var amounts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//achievement struct
struct achievement: View {
    

    var index: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(10)
                .padding([.bottom, .leading, .trailing])
                .frame(height: 180)
                .foregroundColor(Color("AccentColor"))
            HStack {
                VStack {
                    HStack {
                        Text(names[index])
                            .bold()
                            .foregroundColor(.white)
                            .font(.title)
                        Spacer()
                    }
                    .padding(.bottom)
                    HStack {
                        Text(explanations[index])
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                }
                .padding(.leading, 40)
                
                Spacer()
                progressCircle(amount: amounts[index], goal: goals[index])
                    .padding(.trailing, 45)
                    .padding(.bottom, 15)
            }
        }
    }
}

// medal icon: <a href="https://www.flaticon.com/free-icons/trophy" title="trophy icons">Trophy icons created by Freepik - Flaticon</a>

struct progressCircle: View {
    var amount: Int
    var goal: Int
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.teal, lineWidth: 25)
                .frame(width: 120)
                .opacity(0.4)
            Circle()
                .trim(from: 0, to: Double(amount)/Double(goal))
                .stroke(Color.teal, style: StrokeStyle(lineWidth: 25, lineCap: .round))
                .frame(width: 120)
                .rotationEffect(.degrees(-90))
            Text("\(amount)")
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 40))
        }
    }
}
