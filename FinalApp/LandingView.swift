//
//  ContentView.swift
//  FinalApp
//
//  Created by Lana Thyen on 8/15/22.
//

import SwiftUI
import UIKit

struct LandingView: View {
    @State private var isActive = false
    var body: some View {
        NavigationView{
        ZStack {
            Color("logoColor")
                .edgesIgnoringSafeArea(.all)
            GeometryReader {proxy in
                
                VStack {
                    Spacer().frame(height: proxy.size.height * 0.1)
                    Image("logo")
                        .resizable()
                        .frame(width: 300, height: 300)
                    Spacer()
                    NavigationLink(destination: MidView(), isActive: $isActive) {
                        Button(action: {
                            
                            isActive = true
                            
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(
                                        Color("landingButton")
                                    )
                                    .frame(width: 250, height: 75)
                                Text("Get Started")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 24))
                            }
                            
                            
                        }
                    }
                    Spacer()
                }.position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
                
            }
    
        }
        }.navigationBarHidden(true)
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
            .preferredColorScheme(.light)
    }
}

