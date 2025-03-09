//
//  CongratulationsView.swift
//  BreadWinner
//
//  Created by Bella W on 09/03/2025.
//

import SwiftUI

struct CongratulationsView: View {
    var body: some View {
        ScrollView {
            HStack {
                Image("BreadHappy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text("You've done so well in February!!").font(.title)
                    Text("Let's see the progress you've made")
                    
                }
                .padding(.trailing)
            }
            Divider()
            
            Image("BreadScreenTimeDetail")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .padding()
            Spacer()
            Divider()
            NavigationLink(destination: {
                PresentRewardView()
            }, label: {
                Text("Reveal my rewards")
                    .foregroundColor(.white)
                    .font(.headline)
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(.primary)
            .cornerRadius(8)
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
        .background(breadColor1)
    }
}

#Preview {
    CongratulationsView()
}
