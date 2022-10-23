//
//  SettingsView.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/12/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).opacity(0.4)
            ScrollView (.vertical) {
                    
                HStack {
                    Spacer()
                    Text("Unsplash Image Attributions")
                        .bold()
                        .padding()
                        .font(.title)
                    Spacer()
                }
                        VStack {

                            Group {
                                Text("- Alexandra Tran (https://unsplash.com/@schimiggy)")
                                Text("- Elena Kloppenburg (https://unsplash.com/@elli19)")
                                Text("- Elena Kloppenburg (https://unsplash.com/@elli19)")
                                Text("- Kelly Sikkema (https://unsplash.com/@kellysikkema)")
                                Text("- Patrick Hendry (https://unsplash.com/@worldsbetweenlines)")
        
                            }
                            Group {
                                Text("- Ørjan Windsland (https://unsplash.com/@orjanwi)")
                                Text("- Stephanie Cook (https://unsplash.com/@stephtcook)")
                                Text("- Serena Repice Lentini (https://unsplash.com/@serenarepice)")
                                Text("- sporlab (https://unsplash.com/@sporlab)")
                                Text("- Sandie Clark (https://unsplash.com/@honeypoppet)")
                            }
                            Group {
                                Text("- Drew Colins (https://unsplash.com/@drewcolins)")
                                Text("- Viktor Bystrov (https://unsplash.com/@xokvictor)")
                                Text("- Markus Spiske (https://unsplash.com/@markusspiske)")
                                Text("- Brook Anderson (https://unsplash.com/@brookanderson)")
                                Text("- Greg Rosenke (https://unsplash.com/@greg_rosenke)")
                            }
                            Group {
                                Text("- Ian Stauffer (https://unsplash.com/@ianstauffer)")
                                Text("- Ravi Pinisetti (https://unsplash.com/@ravipinisetti)")
                                Text("- Henry Xu (https://unsplash.com/@henry2cute)")
                                Text("- Jay Solomon (https://unsplash.com/@jay_solomon)")
                                Text("- Josh Gordon (https://unsplash.com/@joshgordon)")
                                Text("- Forest Simon (https://unsplash.com/@forest_ms)")
                                Text("- Timo Volz (https://unsplash.com/@magict1911)")
                            }
                        }.padding()
            
                
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
