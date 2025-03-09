//
//  InterestChoice.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct InterestChoice: View {
    
    let title: String
    let icon: String
    
    @State var isChecked = false
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
            
        }, label: {
            if isChecked {
                HStack {
                    Image(systemName: icon).font(.title2)

                    Spacer()
                    Text(verbatim: title).font(.title2)
                    
                }.padding()
                    .background(Color.green)
                    .cornerRadius(12)
                    .padding(.leading)
                    .padding(.trailing)
                    .foregroundColor(.white)
            } else {
                HStack {
                    Image(systemName: icon).font(.title2)

                    Spacer()
                    Text(verbatim: title).font(.title2)
                    
                }.padding()
                    .background(.thinMaterial)
                    .cornerRadius(12)
                    .padding(.leading)
                    .padding(.trailing)
                    .foregroundColor(.black)
            }
            
        })
        
    }
}

#Preview {
    InterestChoice(title: "Parks", icon: "tree.fill")
}
