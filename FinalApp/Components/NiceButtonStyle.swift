//
//  NiceButtonStyle.swift
//  FinalApp
//
//  Created by Lana Thyen on 8/23/22.
//

import Foundation
import SwiftUI

struct NiceButtonStyle: ButtonStyle {
    var fillColor: Color = Color("AccentColor")
    func makeBody(configuration: Configuration) -> some View {
        return NiceButton(
            configuration: configuration,
            fillColor: fillColor
        )
    }
    
    struct NiceButton: View {
        let configuration: Configuration
        let fillColor: Color
        var body: some View {
            return configuration.label
                .padding(EdgeInsets(top:20, leading: 50, bottom: 20, trailing: 50))
                .background(
                    RoundedRectangle(
                        cornerRadius: 30
                    ).fill(
                        fillColor
                    )
                )
                .foregroundColor(.white)
        }
    }
}
