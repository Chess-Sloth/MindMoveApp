//
//  TrendsView.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/12/22.
//

import SwiftUI

import SwiftUICharts

struct TrendsView: View {
    
    @EnvironmentObject var dones: CompletedWorkout
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.green, .cyan]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).opacity(0.4)
            ScrollView (.vertical) {
                VStack {
                    // Line chart
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 400)
                            .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        LineView(data: ratings.map { Double($0) }, title: "Activity Ratings")
                            .frame(height: 350)
                            .padding()
                            .edgesIgnoringSafeArea(.all)
                    }
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 20)
                    HStack {
                        Text("Finished Activities")
                            .bold()
                            .padding(.leading)
                            .font(.title)
                        Spacer()
                    }
                    ForEach(Array(zip(ratings, dones.completedworkouts)), id: \.1) { rating, item in
                        doneBar(image: item.imageName, text: item.category.rawValue, rate: rating, long: item.duration)
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    HStack {
                        Text("My Top Words")
                            .bold()
                            .padding(.leading)
                            .font(.title)
                        Spacer()
                    }
                    VStack {
                        ForEach(words, id: \.self) { word in
                            PopWord(word: word)
                        }
                    }
                    //Pie Chart of exercise type
                }
            }
        }
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView()
            .environmentObject(ModelData())
            .environmentObject(CompletedWorkout())
    }
}
/* Line graph of activity ratings
MIT License

Copyright (c) 2019 Andras Samu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
