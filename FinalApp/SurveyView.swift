//
//  SurveyView.swift
//  FinalApp
//
//  Created by Lana Thyen on 8/29/22.
//

import SwiftUI

struct SurveyView: View {
    @State private var question = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.4)
            VStack(spacing:40) {
                Spacer()
                Text("Short Survey")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(Color("AccentColor"))
                Text("Making some recommendations...")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
                    .font(.system(size: 22))
                Spacer()
                NavigationLink(destination: QuestionView(), isActive: $question) {
                    Button(action: {
                        
                        question = true;
                        
                    }) {

                        Text("Let's Go!")
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                        
                        
                    }.buttonStyle(NiceButtonStyle())
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}
