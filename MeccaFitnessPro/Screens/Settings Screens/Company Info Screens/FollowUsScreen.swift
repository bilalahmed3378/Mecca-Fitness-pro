//
//  FollowUsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//


import SwiftUI
import Stripe
import PassKit



struct FollowUsScreen: View {
    
    @State var showWebView : Bool = false
   
    
    @Environment(\.presentationMode) var presentationMode
    
  
    
    
    var body: some View {
        
        
        
        ZStack{
            
            VStack{
                
                
                // top bar
                
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
                    
                   
                    
                    Text("Follow Us")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                HStack{
                    
                    
                    Text("Follow us on social media platforms")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Spacer()
                    
                    
                }
                .padding(.top,40)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
              
               
            
                
                Link(destination: URL(string: "https://twitter.com/fitness_mecca")!, label: {
                    Image(uiImage: UIImage(named: AppImages.twitterButtonIcon)!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: (UIScreen.screenWidth-40))
                            .padding(.top,50)
                })
             
                
                Link(destination: URL(string: "https://www.instagram.com/mecca_of_fitness_/")!, label: {
                    Image(uiImage: UIImage(named: AppImages.instagramButtonIcon)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: (UIScreen.screenWidth-40))
                        .padding(.top,20)
                })
             
             
        
                Link(destination: URL(string: "https://www.facebook.com/Meccaoffitness/")!, label: {
                    Image(uiImage: UIImage(named: AppImages.facebookButtonIcon)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: (UIScreen.screenWidth-40))
                        .padding(.top,20)
              
                })
             
                
                NavigationLink(destination: {
                    CardDetailsScreen()
                }, label: {
                   
                    Text("Click to Navigate Card Details Screen")
                        .frame(width: (UIScreen.screenWidth-40))
                        .padding(.top,20)
                    
                    
                })
                
                
                
                
                
              
                
               
              
                
                
                Spacer()
                
            }
            
            
            
        }
        .navigationBarHidden(true)
       
       
        
        
    }
}





