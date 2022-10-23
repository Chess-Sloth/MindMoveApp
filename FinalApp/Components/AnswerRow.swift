//
//  AnswerRow.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/3/22.
//

import SwiftUI

struct AnswerRow: View {

    var text: String
    
    @Binding var isSelected: Bool
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color("AccentColor"))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
    }
}
