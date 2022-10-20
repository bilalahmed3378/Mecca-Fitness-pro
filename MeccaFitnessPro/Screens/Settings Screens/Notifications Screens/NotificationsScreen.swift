//
//  NotificationsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct NotificationsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    

    @State var comments : Bool = true
    @State var like : Bool = true
    @State var newTopics : Bool = false
    @State var inviteToJoin : Bool = false
    @State var recommended : Bool = false
    
    
    @State var eventsFollowings : Bool = true
    @State var eventsSaved : Bool = true
    
    
    @State var professionalFollowings : Bool = true
    @State var professionalSaved : Bool = true
    
    
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
                    
                   
                    
                    Text("Notifications")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
        
                
                ScrollView(.vertical,showsIndicators: false){
                    
              
                    
                    VStack(alignment: .leading, spacing: 15){
                        
                        
                        // Kliques group
                        Group{
                            
                           
                            
                            // comments toggle
                            HStack{
                                
                                Text("Booking Notifications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$comments)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            
                            // Likes toggle
                            HStack{
                                
                                Text("Order Updates Notofications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$like)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            
                            // New Topics toggle
                            HStack{
                                
                                Text("Vote Notifications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$newTopics)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            // Invites to Join toggle
                            HStack{
                                
                                Text("Rating Notifications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$inviteToJoin)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            // Recommended Kliques toggle
                            HStack{
                                
                                Text("Messages Notifications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$recommended)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                        }
                        
                        
                        
                        
                            // Events group
                            Group{
                                
                               
                                
                                
                                // event Followings toggle
                                HStack{
                                    
                                    Text("Support Notifications")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Toggle("", isOn: self.$eventsFollowings)
                                        .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                    
                                }
                                
                                
                                
                                
                                // event saved toggle
                              
                                
                                
                            }
                        
                        
                        
                        
                      
                        
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                      
                    
                }
                .padding(.top,10)
                .clipped()
                
                
                
                
                
                NavigationLink(destination: NotificationsUpdatedSuccessScreen(isFlowRootActive: self.$isFlowRootActive)){
                    
                    GradientButton(lable: "Update")
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)
                .padding(.top,10)
                
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}

