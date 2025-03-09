//
//  OnboardingInterests.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct OnboardingInterests: View {
    
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .leading) {
                    Text("Choose your interests").font(.title)
                    Section {
                        
                    }
                    Text("Choose your preferred budget range")
                    BudgetPickerView()
                    HStack {
                        
                    }
                    Text("Pick at least 5 options so we can tailor your rewards to you.")
                }
                Spacer()
            }.padding()
            
            Spacer()
            ScrollView {
                InterestChoice(title: "Parks", icon: "tree.fill")
                InterestChoice(title: "Cafés", icon: "cup.and.saucer.fill")
                InterestChoice(title: "Spas", icon: "bubbles.and.sparkles.fill")
                InterestChoice(title: "Eating out", icon: "fork.knife")
                InterestChoice(title: "Films", icon: "film")
                InterestChoice(title: "Shopping", icon: "bag.fill")
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Confirm interests").foregroundColor(.black)
                    .font(.headline)
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(.thickMaterial)
            .cornerRadius(8)
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
            
            
            
        }.background(breadColor1)
            //.navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingInterests()
}
