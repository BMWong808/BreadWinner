//
//  DemoSelectView.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct DemoSelectView: View {
    
    @State var isPresentingOnboarding = false
    @State var isPresentingInterruption = false
    @State var isPresentingHome = false
    
    var body: some View {
        if !(isPresentingOnboarding || isPresentingInterruption || isPresentingHome) {
            VStack {
                Button(action: {
                    isPresentingOnboarding = true
                }, label: {
                    Text("Onboarding Flow")
                    
                })
                .padding()
                Button(action: {
                    isPresentingInterruption = true
                }, label: {
                    Text("Doomscroll Interruption Flow")
                    
                })
                .padding()
                Button(action: {
                    isPresentingHome = true
                }, label: {
                    Text("Homepage Flow")
                    
                })
                .padding()
            }
        }
        if isPresentingInterruption {
            ContentView()
        }
        if isPresentingHome {
            NavigationStack {
                BreadHomeView()
            }
        }
        if isPresentingOnboarding {
            NavigationStack {
                OnboardingAccount()
            }
            
        }
    }
}
    

#Preview {
    DemoSelectView()
}
