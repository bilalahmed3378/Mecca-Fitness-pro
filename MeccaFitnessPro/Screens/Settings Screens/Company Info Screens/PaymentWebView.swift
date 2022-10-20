//
//  PaymentWebView.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 07/10/2022.
//

import SwiftUI

struct PaymentWebView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    let Link : String
    
    init( link : String  ) {
      
        self.Link = link
       
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


