//
//  OnboardingChooseBread.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct OnboardingChooseBread: View {
    var body: some View {
        NavigationLink(destination: {
            OnboardingInterests()
        }, label: {
            Image("ChooseBreadScreen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        })
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    OnboardingChooseBread()
}
