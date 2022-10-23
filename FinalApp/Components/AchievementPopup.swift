//
//  AchievementPopup.swift
//  FinalApp
//
//  Created by Lana Thyen on 10/19/22.
//

import SwiftUI

struct AchievementPopup: View {
    @Binding var achieveShow: Bool
    var workoutName: String
    var number: Int
    var body: some View {
        ZStack {
            if achieveShow {
                Color.black.opacity(achieveShow ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                Rectangle()
                    .frame(width: 300, height: 400)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                VStack {
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .foregroundColor(.green)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 125)
                    Spacer()
                        .frame(height: 20)
                    Text("You did it!")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.bottom, 5)
                    Text("You completed all \(number) \(workoutName) activities!")
                    Spacer()
                        .frame(height: 40)
                    Button(action: {
                        achieveShow = false
                    }) {
                        Text("Close")
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                    }.buttonStyle(NiceButtonStyle())
                }
            }
        }
    }
}

struct AchievementPopup_Previews: PreviewProvider {
    static var previews: some View {
        AchievementPopup(achieveShow: .constant(true), workoutName: "Biking", number: 10)
    }
}
