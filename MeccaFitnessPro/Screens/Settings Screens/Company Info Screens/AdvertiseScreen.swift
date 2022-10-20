//
//  AdvertiseScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct AdvertiseScreen: View {
    
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
                    
                   
                    
                    Text("Advertise")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
        
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("Advertising Cookies")
                                .font(AppFonts.ceraPro_24)
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.top,10)
                        
                        
                        HStack{
                            Text("Mecca of Fitness uses cookies and similar tools (collectively referred to as cookies) to serve you with advertisements that are relevant, interesting, and more engaging. \n\nThroughout our website, we have links to third-party sites placed by our advertising partners to and they may redirect you to the services they provide. The third parties may use cookies from our website and others as well as from different devices to gather browsing information, website activity information, your IP address, device, cookie, and advertising IDs and other identifiers, your general location details and with your express consent, the geological location of your device. \n\nThis information may be used by the third parties to provide relevant content and advertisements and evaluate their success. This results in our ads being displayed to you on search results pages and other sites across the internet. \n\nBy denying access to cookies, you may prevent us from providing some of our services to you and you may not be able to view our advertisements from different websites.")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        
                        HStack{
                            Text("How To Opt-Out")
                                .font(AppFonts.ceraPro_24)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding(.top,7)
                        
                        HStack{
                            Text("Mecca of Fitness website users can exercise their right to stop receiving advertisements based on their interests by:")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        
                        HStack{
                            Text("\u{2022} Limiting or restricting the use of tracking cookies by utilizing our cookie management tool.")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        HStack{
                            Text("\u{2022} Opting out of some of the advertising products offered by Google by paying a visit to the Google Ads Preference Manager at https://google.com/ads/preferences or by utilizing National Agency Advertising Initiative (NAI) resources by visiting NAI’s  resources online at https://www.netwrkadvertising.org/choices.")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        HStack{
                            Text("\u{2022} To discover how our advertising partners let you opt-out of receiving advertisements based on your   browsing history and to choose which advertising companies can show you advertisements based on your interests, visit The Digital Advertising Alliance’s Resource at http://optout.aboutads.info/. You can also visit the NAI’s online resources at http://www.networkadvertising.org/choices.")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        
                        HStack{
                            Text("Please be advised that opting out of receiving advertisements based on your interests through the National Agency Advertising Initiative and the Digital Advertising Alliance’s will only opt you out of receiving such on the specific browser or device you use for that purpose. You may still receive the aforementioned advertisements on your other devices and you must opt-out of the service from all your other devices and browsers. \n\nIf you change your browser’s settings, delete cookies from your browser or device, start using another device, browser, computer, or operating system, you will have to opt-out of the service again using the same procedures mentioned above. Opting out may be ineffective when you attempt it if your browser is not set to accept cookies.")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        
                    }
              
                   
                      
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .overlay(DisolvingEffect()
                            .padding(.top,10))
                .clipped()
                
                
               
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}

