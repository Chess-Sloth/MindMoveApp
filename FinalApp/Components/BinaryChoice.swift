//
//  BinaryChoice.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/5/22.
//

import SwiftUI

public var isSelected = false
public var isSelected2 = false
public var showAlert = false

var filteredCategories = [String: [workout]]()

struct BinaryChoice: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var menuActive = false
    @State public var isSelected = false
    @State public var isSelected2 = false
    @State public var showAlert = false
    
    @Binding var index: Int
    @Binding var progress : CGFloat
    @Binding var exerciseTypes: [String]
    
    @State private var start: Bool = false
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                
                Text(questions[index])
                    .bold()
                    .font(.system(size: 20))
                    .frame(width: 398)
                    .foregroundColor(Color("AccentColor"))
                    .padding([.bottom])
                AnswerRow(text: "Yes", isSelected: $isSelected)
                    .onTapGesture {
                        isSelected.toggle()
                        if isSelected {
                            isSelected2 = false
                          
                        }
                    }
                AnswerRow(text: "No", isSelected: $isSelected2)
                    .onTapGesture {
                        isSelected2.toggle()
                        if isSelected2 {
                            isSelected = false
    
                            noList.append(keys[index])
                           
                        }
                    }
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: MenuView(), isActive: $menuActive ) {
                        Button(action: {
                            if (isSelected == false && isSelected2 == false) {
                                start = true
                                withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                                    start = false
                                }
                            } else if (index == 4) {
                                filteredCategories = modelData.categories
                                for thing in noList {
                                    filteredCategories.removeValue(forKey: thing)
                                }
                                menuActive = true
                                
                            } else {

                                index += 1
                                progress += 0.2
                            }
                            
                            isSelected = false
                            isSelected2 = false
                    
                        }) {
                            Text("Next")
                                .fontWeight(.semibold)
                                .font(.system(size: 24))
                        }.buttonStyle(NiceButtonStyle()).offset(x: start ? 30 : 0)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            Spacer()
    }
}
