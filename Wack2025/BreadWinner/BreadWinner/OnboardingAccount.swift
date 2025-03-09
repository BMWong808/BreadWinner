//
//  OnboardingAccount.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI
import AuthenticationServices

struct OnboardingAccount: View {
    var body: some View {
        VStack {
            Image("BreadAngel")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Welcome to Breadwinner!").font(.title)
            Text("Take control of your time and vanquish your doomscrolling habit today!").font(.headline).multilineTextAlignment(.center)
            Spacer()
            Text("Get Started")
            SignInWithAppleButton(.signUp) { request in
                // authorization request for an Apple ID
            } onCompletion: { result in
                // completion handler that is called when the sign-in completes
            }
            .frame(height: 50)
            .padding(.leading)
            .padding(.trailing)
            /*
            Button(action: {}, label: {
                Text("Sign in with email").foregroundColor(.black)
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(.thinMaterial)
            .cornerRadius(8)
            .padding(.leading)
            .padding(.trailing)
             */
            
            NavigationLink(destination: {
                OnboardingChooseBread()
            }, label: {
                Text("Sign in with email").foregroundColor(.black)
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(.thinMaterial)
            .cornerRadius(8)
            .padding(.leading)
            .padding(.trailing)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Already have an account? Sign in")
            })
            .padding(.top)
            .padding(.bottom)
            
            
            Spacer()
            
        }
        .background(breadColor1)
        
    }
}

#Preview {
    OnboardingAccount()
}
