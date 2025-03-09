//
//  BreadInterruptionView.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct BreadInterruptionView: View {
    
    @Binding var isPresenting: Bool
    
    @State var breadAppearing = false
    
    var body: some View {
        withAnimation(.easeIn(duration: 3.5)) {
            VStack {
                if breadAppearing {
                    VStack {
                        Image("BreadHappy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Bready for a break?").font(.title)
                        Text("Your time is up!").font(.headline)
                        Text("Find some fun activities to try!")
                        Button(action: {
                            
                        }, label: {
                            Text("Take me there").padding()
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(12)
                        })
                    }
                    .transition(.opacity)
                    /*
                     Image("BreadyForABreak")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .transition(.move(edge: .bottom))
                     */
                }
            }
            .onAppear(perform: {
                breadAppearing = true
            })
        }
    }
}
