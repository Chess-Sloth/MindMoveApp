//
//  ProgressBar.swift
//  FinalApp
//
//  Created by Lana Thyen on 8/30/22.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress : CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 410, maxHeight: 4)
                .foregroundColor(Color(hue: 0.335, saturation: 0.186, brightness: 0.273, opacity: 0.171))
                .cornerRadius(10)
            Rectangle()
                .frame(width: (progress*410), height: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
        }
    }
}
