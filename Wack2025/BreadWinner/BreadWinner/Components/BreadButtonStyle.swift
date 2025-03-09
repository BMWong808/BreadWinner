//
//  BreadButtonStyle.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct BreadButtonStyle: ButtonStyle {
    
    var isSelected = false
    
    func makeBody(configuration: Configuration) -> some View {
        if isSelected {
            configuration.label
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                .cornerRadius(8)
        } else {
            configuration.label
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(8)
        }
        
            
    }
}
