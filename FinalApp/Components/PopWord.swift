//
//  PopWord.swift
//  FinalApp
//
//  Created by Lana Thyen on 10/9/22.
//

import SwiftUI

struct PopWord: View {
    var word: String
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 400, height: 70)
                .foregroundColor(.white)
                .cornerRadius(50)
            Text(word)
                .foregroundColor(Color("AccentColor"))
                .bold()
                .fontWeight(.semibold)
                .font(.system(size: 40))
        }
    }
}

struct PopWord_Previews: PreviewProvider {
    static var previews: some View {
        PopWord(word: "Accomplished")
    }
}
