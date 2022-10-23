//
//  doneBar.swift
//  FinalApp
//
//  Created by Lana Thyen on 10/6/22.
//

import SwiftUI

struct doneBar: View {
    var image: String
    var text: String
    var rate: Int
    var long: Int
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.gray)
                .opacity(0.5)
                .cornerRadius(10)
                .padding([.leading, .trailing])
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
                    .padding(.leading, 30)
                VStack {
                    HStack {
                        Text(text)
                            .bold()
                            .padding(.bottom)
                        Spacer()
                    }
                    HStack {
                        Text("\(long) mins")
                        Spacer()
                    }
                }
                Spacer()
                Text("\(rate)")
                    .font(.system(size: 30))
                    .padding(.trailing, 40)
            }
        }
    }
}

struct doneBar_Previews: PreviewProvider {
    static var previews: some View {
        doneBar(image: "yogaImage", text: "Yoga", rate: 0, long: 30)
    }
}
