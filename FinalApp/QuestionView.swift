//
//  QuestionView.swift
//  FinalApp
//
//  Created by Lana Thyen on 8/30/22.
//

import SwiftUI
import Foundation


let questions = ["Do you have regular access to access to a pool?", "Do you have a large enough (about 6 foot squared) area in you house to exercise?", "Do you have or can you borrow a bicycle?", "Do you have access to a large outdoor space (e.g. a track, a neighborhood street)?", "Do you have a quiet space free of distractions at home?"]

let jsonIndices = [5, 1, 4, 0, 9]
var keys = ["Swimming", "Biking", "Running", "Meditation", "Strength Training"]
var noList = [String]()

struct QuestionView: View {
    @State private var index : Int = 0
    @State private var progress : CGFloat = 0.0
    
    @State public var exerciseTypes = ["Meditation", "Biking", "Walking", "Yoga", "Running", "Swimming", "Stretching", "Strength Training", "Climbing", "Sport", "Gardening", "Dancing", "Pilates"]
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).opacity(0.4)
            VStack(spacing: 40) {
                HStack {
                    Text("Survey")
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                        .foregroundColor(Color("AccentColor"))
                    Spacer()
                    Text("\(index+1) of 5")
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                        .foregroundColor(Color("AccentColor"))
                }
                .padding([.leading, .trailing], 10)
                ProgressBar(progress: self.$progress)
                    .padding([.leading, .trailing], 10)
                
                BinaryChoice(index: self.$index, progress: self.$progress, exerciseTypes: $exerciseTypes)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}

