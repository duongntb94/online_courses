//
//  ContentView.swift
//  Restart
//
//  Created by Duong on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        if isOnboardingViewActive {
            OnboardingView()
        } else {
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
