//
//  Toast.swift
//  KinderLand
//
//  Created by CodeCue on 14/01/2022.
//

import SwiftUI

struct Toast: View {
    
    @Binding var isShowing : Bool
    let message : String
    
    var body: some View {
        
        VStack{
            Spacer()
            VStack(alignment:.leading){
                HStack{
                    Image("Logo")
                        .resizable()
                        .frame(width: UIScreen.screenWidth / 8, height: UIScreen.screenHeight / 35, alignment: .center)
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25.0, height: 25.0,alignment:.center)
                        .foregroundColor(Color("ButtonColor"))
                        .onTapGesture(perform: {
                            isShowing = false
                        })
                }
                Text(self.message)
                    .font(.system(size: 18))
                    .foregroundColor(Color("TextColor"))
                    .padding(.bottom,10)
                    .padding(.top , 20)
            }
            .padding(10)
            .background(Color("CardColor"))
            .cornerRadius(10.0)
            .padding(.bottom , 20)
            .padding(.leading , 20)
            .padding(.trailing , 20)
            .shadow(radius: 10,  y: 10)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if(self.isShowing){
                    isShowing.toggle()
                }
            }
        })
    }
    
}

