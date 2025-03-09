//
//  ContentView.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

/*
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

 */

let breadColor1 = Color(red: 226/255, green: 209/255, blue: 165/255)

#Preview {
    ContentView()
}

struct ContentView: View {
    
    @State var isShowingSheet = false
    
    var body: some View {
        Image("instagram")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $isShowingSheet, content: {
                BreadInterruptionView(isPresenting: $isShowingSheet)
            })
            .onTapGesture {
                isShowingSheet = true
            }
    }
}
