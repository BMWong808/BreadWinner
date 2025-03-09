//
//  BreadHomeView.swift
//  BreadWinner
//
//  Created by Bella W on 08/03/2025.
//

import SwiftUI

struct BreadHomeView: View {
    
    @State var breadHealth: Double = 30
    
    var breadImage: String {
        if(breadHealth > 95) {
            return "BreadAngel"
        } else if(breadHealth > 85) {
            return "BreadHappiest"
        } else if(breadHealth > 70) {
            return "BreadHappier"
        }  else if(breadHealth > 50) {
            return "BreadHappy"
        } else if(breadHealth > 40) {
            return "BreadSad"
        } else if(breadHealth > 32) {
            return "BreadSadMoldy"
        } else if(breadHealth > 24) {
           return "BreadSadderMoldier"
        } else if(breadHealth > 13) {
            return "BreadToast"
        } else {
            return "BreadDeadFire"
        }
    }
    
    var breadDescription: String {
        if(breadHealth > 95) {
            return "Bread is so so proud of you!"
        } else if(breadHealth > 85) {
            return "Bread is so proud of you!"
        } else if(breadHealth > 70) {
            return "Bread is happy you're making healthy habits!"
        }  else if(breadHealth > 50) {
            return "Bread is pleased that you're not scrolling!"
        } else if(breadHealth > 40) {
            return "Bread feels a bit sad - watch your screen time!"
        } else if(breadHealth > 32) {
            return "Bread's sad because you're not making healthy habits.."
        } else if(breadHealth > 24) {
           return "Bread is crying!"
        } else if(breadHealth > 13) {
            return "Bread's getting really upset but it's not too late!"
        } else {
            return "Bread isn't doing so well. Is everything okay?"
        }
    }
    var body: some View {
        VStack {
            Slider(value: $breadHealth, in: 0...100)
            Image(breadImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(verbatim: breadDescription).font(.title).multilineTextAlignment(.center)
            Divider()
            
            VStack {
                if(breadHealth > 50) {
                    Text("Your progress and rewards for February are here!").font(.headline)
                    
                    NavigationLink(destination: {
                        CongratulationsView()
                    }, label: {
                        HStack {
                            Text("See them now").foregroundColor(.white)
                                .font(.headline)
                                .padding(.leading)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding(.trailing)
                        }
                        
                        
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green)
                    .cornerRadius(8)
                    .padding()
                } else {
                    if(breadHealth > 20) {
                        Text("Don't worry! You can still get back on track with healthy habits").font(.headline)
                    } else {
                        Text("It's okay. Follow our suggestions to help get you back on track.").font(.headline)
                    }
                    
                    NavigationLink(destination: {
                        CongratulationsView()
                    }, label: {
                        HStack {
                            Text("Suggestions").foregroundColor(.white)
                                .font(.headline)
                                .padding(.leading)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding(.trailing)
                        }
                        
                        
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.pink)
                    .cornerRadius(8)
                    .padding()
                }
                
            }.padding().multilineTextAlignment(.center)
            Spacer()
        }
        .background(breadColor1)
    }
}

#Preview {
    BreadHomeView()
}
