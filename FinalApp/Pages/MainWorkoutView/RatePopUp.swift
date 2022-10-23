//
//  RatePopUp.swift
//  FinalApp
//
//  Created by Lana Thyen on 10/9/22.
//

import SwiftUI

var rating = 5.0
var ratings = [Int]()
struct RatePopUp: View {
    @Binding var show: Bool
    @State public var rating: Double = 5.0
    var body: some View {
        ZStack {
            if show {
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                Rectangle()
                    .frame(width: 300, height: 500)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                VStack {
                    Image("target")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.leading)
                    Text("Awesome!")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.bottom, 5)
                    Text("On a scale from 1 to 10 with 1 being worst, how much better did you feel after this activity?")
                        .frame(width: 250)
                    
                    Slider(value: $rating, in: 0...10, step: 1)
                        .padding()
                        .frame(width: 250)
                    Text("Rating: \(Int(rating))")
                    
                    //go back
                    Spacer()
                        .frame(height: 30)
                    Button (action: {
                        amounts[goalNUM] = amounts[goalNUM] + 1
                        amounts[7] = amounts[7]+1
                        amounts[8] = amounts[8]+1
                        amounts[9] = amounts[9]+1
                        /*
                        if (amounts[goalNUM] == 10 || amounts[7] == 10) {
                            accomplish = true
                        }
                         */
                        print(amounts)
                        ratings.append(Int(rating))
                        show = false
                    }) {
                        Text("Log")
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                    }.buttonStyle(NiceButtonStyle())
            }
            }
        }
    }
}

struct RatePopUp_Previews: PreviewProvider {
    static var previews: some View {
        RatePopUp(show: .constant(true))
    }
}
