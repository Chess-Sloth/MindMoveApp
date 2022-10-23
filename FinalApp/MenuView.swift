//
//  SwiftUIView.swift
//  FinalApp
//
//  Created by Lana Thyen on 9/7/22.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var dones: CompletedWorkout
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }
    var body: some View {
                TabView {
                    MainView()
                        .tabItem {
                            Label("Exercise", systemImage: "figure.walk")
                        }
                    TrendsView()
                        .tabItem {
                            Label("Trends", systemImage: "chart.line.uptrend.xyaxis")
                        }
                    GoalsView()
                        .tabItem {
                            Label("Goals", systemImage: "checkmark.square")
                        }
                    SettingsView()
                        .tabItem {
                            Label("Attributions", systemImage: "person.circle")
                        }
                }
                .accentColor(Color("AccentColor"))
                .navigationBarHidden(true)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(CompletedWorkout())
            .environmentObject(ModelData())
    }
}
