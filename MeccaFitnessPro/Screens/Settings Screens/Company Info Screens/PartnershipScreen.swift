//
//  PartnershipScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct PartnershipScreen: View {
    
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
                    
                   
                    
                    Text("Partnership")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
        
                
                ScrollView(.vertical,showsIndicators: false){
                    
              
                    VStack(alignment: .leading){
                        
                        Group{
                            HStack{
                                Text("Partnership Opportunities")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(Color.blue)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,10)
                            
                            HStack{
                                Text("Let’s Grow Together ")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            HStack{
                                Text("Mecca of Fitness partners with fitness and wellness professionals, event organizers and other business entities to help them get more prospects, boost client retention and generate more revenue. We achieve this by catering to the unique requirements of our clients to help them reach their fitness, health and wellness goals.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("The Mecca of Fitness Advantage")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            HStack{
                                Text("By working with Mecca of Fitness, you unlock a wide range of benefits including:")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                            HStack{
                                Text("\u{2022} Better Prospects and Client Retention")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Get high intent leads guaranteed to convert along with increased returning clients.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            HStack{
                                Text("\u{2022} Global Reach")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Get access to clients from all over the globe and chat directly with users on our platform.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                        }
                        
                        Group{
                            HStack{
                                Text("\u{2022} Marketing Opportunities")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Advertise your products and services throughout our platform through banner placements and featured listings.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            HStack{
                                Text("\u{2022} Exclusive Store Access")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Add products and merchandise and purchase products from our online store.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            HStack{
                                Text("\u{2022} Secure Payment Processors")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Our bespoke systems make it easier for you to facilitate refunds, cancellations, order tracking, tickets and invoices.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            HStack{
                                Text("\u{2022} Customer Resource Management Tools")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Our Partners have the ability to access pay for click ad campaigns, featured listings and purchased subscription services to get leads.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                        }
                        
                        Group{
                            HStack{
                                Text("\u{2022} More Subscription Services Features")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Get access to more than just basic listing placements")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.leading,10)
                            
                            HStack{
                                Text("Become a Mecca of Fitness Partner Today!")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            HStack{
                                Text("\u{2022} I am a Fitness ")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} I am a Wellness Professional")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} I am a Meal Prepper")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} I am a Fitness Event Organizer")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} I own a Fitness or Wellness Center")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            .padding(.bottom,10)
                        }
                        
                        
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

