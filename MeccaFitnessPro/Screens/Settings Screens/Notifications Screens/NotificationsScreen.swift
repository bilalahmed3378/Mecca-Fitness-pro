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
                            
                            HStack{
                
                                Text("Kliques")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .padding(.top,20)
                                
                                Spacer()
                                
                            }
                            
                            
                            
                            // comments toggle
                            HStack{
                                
                                Text("Comments")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$comments)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            
                            // Likes toggle
                            HStack{
                                
                                Text("Likes")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$like)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            
                            // New Topics toggle
                            HStack{
                                
                                Text("New Topics")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$newTopics)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            // Invites to Join toggle
                            HStack{
                                
                                Text("Invites to Join")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$inviteToJoin)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            // Recommended Kliques toggle
                            HStack{
                                
                                Text("Recommended Kliques")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$recommended)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                        }
                        
                        
                        
                        
                            // Events group
                            Group{
                                
                                Text("Events")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .padding(.top,30)
                                
                                
                                
                                
                                // event Followings toggle
                                HStack{
                                    
                                    Text("Followings")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Toggle("", isOn: self.$eventsFollowings)
                                        .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                    
                                }
                                
                                
                                
                                
                                // event saved toggle
                                HStack{
                                    
                                    Text("Saved")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Toggle("", isOn: self.$eventsSaved)
                                        .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                    
                                }
                                
                                
                                
                            }
                        
                        
                        
                        
                        // Professionals group
                        Group{
                            
                            Text("Professionals")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,30)
                            
                            
                            
                            
                            // event Followings toggle
                            HStack{
                                
                                Text("Followings")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$professionalFollowings)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
                            
                            // event saved toggle
                            HStack{
                                
                                Text("Saved")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Toggle("", isOn: self.$professionalSaved)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                
                            }
                            
                            
                            
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

