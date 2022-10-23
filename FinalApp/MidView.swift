//
//  MidView.swift
//  FinalApp
//
//  Created by Lana Thyen on 8/25/22.
//

import SwiftUI

struct MidView: View {
    @State private var midYes = false
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).opacity(0.4)
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Exercise benefits your mental health, not just your physical health...")
                            .font(.system(size: 43))
                            .frame(width: 320)
                            .multilineTextAlignment(.center)
                
                        Spacer()
                        
                    }
                    Spacer()
                    NavigationLink(destination: SurveyView(), isActive: $midYes) {
                        Button(action: {
                            midYes = true
                        }) {
                            Text("Next")
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
