//
//  BudgetPickerView.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct BudgetPickerView: View {
    
    @State var selectedOption = 0
    var body: some View {
        HStack {
            Button(action: {
                selectedOption = 1
            }, label: {
                Text("£0-10")
                    .font(.subheadline)
                    .frame(maxHeight:.infinity)
            })
            .buttonStyle(BreadButtonStyle(isSelected: selectedOption == 1))

            Button(action: {
                selectedOption = 2
            }, label: {
                Text("£11-20")
                    .font(.subheadline)
                    .frame(maxHeight:.infinity)
            })
            .buttonStyle(BreadButtonStyle(isSelected: selectedOption == 2))

            Button(action: {
                selectedOption = 3
            }, label: {
                Text("£21-40")
                    .font(.subheadline)
                    .frame(maxHeight:.infinity)
            })
            .buttonStyle(BreadButtonStyle(isSelected: selectedOption == 3))

            Button(action: {
                selectedOption = 4
            }, label: {
                Text("£40+")
                    .font(.subheadline)
                    .frame(maxHeight:.infinity)
            })
            .buttonStyle(BreadButtonStyle(isSelected: selectedOption == 4))

        }
        HStack {
            
        }
    }
}

#Preview {
    BudgetPickerView()
}
