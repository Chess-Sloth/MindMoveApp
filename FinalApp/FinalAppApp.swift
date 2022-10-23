//
//  FinalAppApp.swift
//  FinalApp
//
//  Created by Lana Thyen on 8/15/22.
//

import SwiftUI

@main
struct FinalAppApp: App {
    @StateObject private var modelData = ModelData()
    @StateObject var dones = CompletedWorkout()
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(CompletedWorkout())
                .environmentObject(ModelData())
        }
    }
}
extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
