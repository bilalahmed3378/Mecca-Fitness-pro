//
//  PrivacyScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct PrivacyScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    

    @State var showInfo : Bool = true
    @State var message : Bool = true
    @State var ads : Bool = false
    
    
    @Binding var isFlowRootActive : Bool
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    

    
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
                    
                   
                    
                    Text("Privacy Policy")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack(alignment: .leading){
                        
                        Group{
                            HStack{
                                Text("PRIVACY POLICY")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.top,10)
                            
                            HStack{
                                Text("Effective from: 22/10/2022")
                                    .fontWeight(.bold)
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                            HStack{
                                Text("This Privacy Policy (“Policy”) describes how Mecca of Fitness gathers and protects all of the personal information provided by the users and visitors of our website (“Site”) and all related applications, services, products, and all our third-party app and service integrations. \n\nAt Mecca of Fitness, we value your privacy and we are committed to ensuring that your personal information is protected. We assure you that all information by which you can be identified that we ask of you will be used under this Policy.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                            HStack{
                                Text("Consent")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("Submitting your personal information to us indicates your consent to the processing of your information in the United States or any country in the world and our use of your personal information as described by this Policy and our Terms and Conditions. \n\nBy submitting third-party information to us, you warrant and signify that you have their consent to provide us with their private information and will not hold us responsible for any claims by the aforementioned concerning our processing and use of their information as described by the terms of this policy. \n\nWe do not knowingly collect any identifiable information from children under the age of 13 as governed by the Children’s Online Privacy Protection Act.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                        
                        Group{
                            HStack{
                                Text("Information We Collect")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("To provide you with our business services and products from our store, we may collect the following information:")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            Group{
                                HStack{
                                    Text("\u{2022} Full Name")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    Text("\u{2022} Physical Address")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    Text("\u{2022} Email")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    Text("\u{2022} Phone Number")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    Text("\u{2022} Birthdate")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    Text("\u{2022} Gender")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    Text("\u{2022} Employment")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    Text("\u{2022} Certifications")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.top,5)
                            }
                            HStack{
                                Text("\u{2022} Payment Methods")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} Location")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                            HStack{
                                Text("All users can choose who to share this information with or hide it from other users by modifying their sharing preferences.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                        }
                      
                        Group{
                            HStack{
                                Text("How We Use The Information We Collect")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("We use your personal information to provide and deliver all products and services that you request from us, to assist Gym Owners and service providers in rendering their services to you as required, and to facilitate payments for our products and services through Stripe Payment Gateway. We also use your personal information to identify and recommend products and services that are gender-specific, based on your previous searches or advertised. \n\nMecca of Fitness does not share your data with third-parties. Data may, however, be collected by pool data analytics to study user usage patterns, understand their trends, identify sales opportunities, and improve our products and services.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                            HStack{
                                Text("Information Gathered by Fitness Event Organizers")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("Your personal information is shared with Event Organizers when you register for events through our Site and by filling in any event registration form, you are providing it to both the Event Organizers and Mecca of Fitness. \n\nEvent   Organizers   may   choose   to   collect   additional   information   about   your   event participation, and in this case, Mecca of Fitness acts as a processor or service provider and we use your information as per their instruction. Processing of your personal information by event organizers is subject to their privacy policy and not ours.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                        
                        Group{
                            HStack{
                                Text("Security")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("To ensure that your private information is secure, we employ and maintain the suitable technical measures, organizational procedures, and policies to safeguard the information we collect online and protect it from accidental loss, destruction, disclosure, and unauthorized access depending on its nature through:")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} Password protection, encryption, and secure online payment facilities.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} Non-disclosure agreements for our employees, service providers, partners, and any parties with access to users’ private information")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022}Permanent deletion of data upon account deactivation request for account deletion by the user or when there is no account user activity for one year.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} Adhering to stringent security guidelines in the disclosure and storage of user personal information to prevent unsanctioned access to it.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            
                            HStack{
                                Text("However, internet transmission is never completely secure and while we take all the appropriate measures to protect your information, we cannot guarantee total security of any of the information you send to us over the internet. You agree that any information you send to us through the internet is transmitted at your own risk.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                        
                        Group{
                            HStack{
                                Text("How We Use Cookies")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("Cookies enable us to deliver, measure, and improve our services, and to improve your user experience by tailoring our Site’s operations to your preferences and needs by collecting your browsing data in the form of small text files. \n\nTo find out more information on how we use cookies, please visit our Cookie Policy page.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("How Your Personal Information Is Stored")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("We store all our information and data in documented form on the MongoDB database to enable us to access information easily in the shortest possible time while keeping your information secure. To learn more about how MongoDB secures your personal information, visit https://docs.mongodb.com/manual/security.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Links To Third-Party Websites")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("Our Site may contain third-party links that we have no control over as they are not governed by our Privacy Policy and Terms and Conditions. By following these links, you agree that you will not hold Mecca of Fitness responsible for the security and protection of any information you provide to such sites and you acknowledge that they are not governed by our Privacy Policy or Terms and Conditions. \n\nWe strongly advise you to read and understand the Privacy Policy of such sites before use.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                        
                        Group{
                            HStack{
                                Text("Controlling Your Personal Information")
                                    .font(AppFonts.ceraPro_24)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,7)
                            
                            
                            HStack{
                                Text("Users can restrict the use collection, sharing, or use of their personal information by:")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} Not   providing   certain   information   when   registering   for   our   services provided it is not compulsory for successful registration.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("\u{2022} Hiding information from other users by modifying their preferences.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("If you wish to modify any of the information that you previously sent to us because it is incomplete,   inaccurate,   or   not   up-to-date,   get   in   touch   with   us at support@meccaoffitnes.com and we will correct the information as requested promptly.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                
                                Spacer()
                            }
                            .padding(.top,5)
                        }
                        
                        
                      
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                }
        
                
               
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
        
        
    }
}

