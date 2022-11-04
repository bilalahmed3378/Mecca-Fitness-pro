//
//  RepaymentWebViewScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 10/10/2022.
//

import SwiftUI

struct RePaymentWebView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    let Link : String
    
    init( Relink : String  ) {
      
        self.Link = Relink
       
    }

    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                }
                .padding(.leading,20)
                
                WebView(url: URL(string: "\(Link)")!)

                
                
            }
        }
        .navigationBarHidden(true)
    }
}


