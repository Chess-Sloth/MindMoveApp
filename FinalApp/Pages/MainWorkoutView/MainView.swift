//
//  MainView.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/12/22.
//

import SwiftUI

var showing: Bool = false

struct MainView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).opacity(0.4)
                VStack {
                    HStack {
                        Text("Do it Again")
                            .bold()
                            .padding(.leading)
                            .font(.title)
                        Spacer()
                    }
                    ScrollView(.vertical) {
                        NavigationLink {
                            CategoryDetail(workout: modelData.features[10])
                        } label: {
                            Image(modelData.features[10].imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 400, height: 200)
                                .clipped()
                                .listRowInsets(EdgeInsets())
                                .cornerRadius(5)
                        }

                        HStack {
                            Text("Tailored to You")
                                .bold()
                                .padding()
                                .font(.title)
                            Spacer()
                        }
                        ForEach(filteredCategories.keys.sorted(), id: \.self) { key in
                                CategoryRow(categoryName: key, items: filteredCategories[key]!)
                            }
                            .listRowInsets(EdgeInsets())
                    }
                }
                
            }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(CompletedWorkout())
            .environmentObject(ModelData())
    }
}

/*
 Unsplash Attributions
 - Alexandra Tran (https://unsplash.com/@schimiggy)
 - Elena Kloppenburg (https://unsplash.com/@elli19)
 - Kelly Sikkema (https://unsplash.com/@kellysikkema)
 - Patrick Hendry (https://unsplash.com/@worldsbetweenlines)
 - Ørjan Windsland (https://unsplash.com/@orjanwi)
 - Stephanie Cook (https://unsplash.com/@stephtcook)
 - Serena Repice Lentini (https://unsplash.com/@serenarepice)
 - sporlab (https://unsplash.com/@sporlab)
 - Sandie Clark (https://unsplash.com/@honeypoppet)
 - Drew Colins (https://unsplash.com/@drewcolins)
 - Viktor Bystrov (https://unsplash.com/@xokvictor)
 - Markus Spiske (https://unsplash.com/@markusspiske)
 - Brook Anderson (https://unsplash.com/@brookanderson)
 - Greg Rosenke (https://unsplash.com/@greg_rosenke)
 - Ian Stauffer (https://unsplash.com/@ianstauffer)
 - Ravi Pinisetti (https://unsplash.com/@ravipinisetti)
 - Henry Xu (https://unsplash.com/@henry2cute)
 - Jay Solomon (https://unsplash.com/@jay_solomon)
 - Josh Gordon (https://unsplash.com/@joshgordon)
 - Forest Simon (https://unsplash.com/@forest_ms)
 - Timo Volz (https://unsplash.com/@magict1911)
 */
