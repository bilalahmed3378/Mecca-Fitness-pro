//
//  AboutSreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct AboutScreen: View {
    
    
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
                    
                   
                    
                    Text("About Us")
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
                                Text("About Us")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(Color.blue)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,10)
                            
                            
                            HStack{
                                Text("Live Fit | Live Life | Live Long")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("Established in 2020, Mecca of Fitness is one of the fastest-growing online fitness and wellness platforms serving a national clientele. It was established to create a positive environment where fitness enthusiasts, beginners, and professionals can come together to achieve their fitness goals and share products, services, and information. Behind us is a powerful community that serves a common purpose dedicated to helping you become the best version of yourself irrespective of the fitness level, shape, or stage of life you are in.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Our Core Values")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("Our exclusivity stems from the core values that describe our ethos and define us. We believe becoming “Mecca Fit” is a state of being that can only be achieved when we work together, and it represents the philosophy that guides our community.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Motivational")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Motivational")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Energy")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Continuously")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                            
                        Group{
                            HStack{
                                Text("Creating")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Achievement")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("WHILE")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Ferociously")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Inspiring")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Teamwork")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                        
                        Group{
                            HStack{
                                Text("We Are On A Mission")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,8)
                            
                            
                            HStack{
                                Text("It is our mission to provide a dynamic and interactive web-based platform that incorporates innovative solutions to provide real-time data to support the holistic fitness and health objectives of our members and return on investment for our partners.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Our Vision")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("It is our vison to become the pioneers of the revolutionary movement of helping people develop their own Mecca –  Motivational Energy Continuously Creating Achievement. \n\nWe aim to become a leading platform in the digital space that combines health, fitness, wellness, event, products, and services that caters to people from all over the world.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Our Objectives")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("At Mecca of Fitness, we hold our objectives to the highest regard as they are the embodiment of our purpose. \n\nOur Key Objectives Are To:")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                        
                        Group{
                            HStack{
                                Text("1. Function as the world’s largest fitness & wellness online search engine and listing platform")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("2. Serve as the ambassador of holistic fitness and wellness worldwide.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("3. Obtain maximize customer satisfaction and obtain high customer growth and retention through enhanced customer experience and premium service delivery.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("4. Seize industry gaps through strong partnerships and the integration of the latest technology into our systems by innovating and adopting lean management principles within our platforms and operations.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("5. Utilize cross-selling opportunities from the external environment.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                            HStack{
                                Text("6. Contribute to job creation & improvement of the global socio-economic environment")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("7. Provide user-friendly website interface & secure payment route")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("8. Reinforce brand identity and enhance brand awareness and engagement by building trust.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("9. Employ and utilize data science & business intelligence principles for customer trends, patterns, and behavioral analysis to deliver an unparalleled customer experience while operating through business models that guarantee promising results for our stakeholders.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Establish a well-integrated database of gyms, fitness centers, trainers, coaches, wellness providers, fitness events, and products.")
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

