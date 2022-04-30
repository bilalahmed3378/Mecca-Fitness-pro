//
//  AvaliablityHourseSetupPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct AvaliablityHourseSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    // day toggles
    
    @State var mondayToggle  : Bool = false
    @State var tusedayToggle  : Bool = false
    @State var wednesdayToggle  : Bool = false
    @State var thursdayToggle  : Bool = false
    @State var fridayToggle  : Bool = false
    @State var saturdayToggle  : Bool = false
    @State var sundayToggle  : Bool = false
    
    
    // start times
    
    @State var mondayStartTime : Date = Date()
    @State var tusedayStartTime : Date = Date()
    @State var wednesdayStartTime : Date = Date()
    @State var thursdayStartTime : Date = Date()
    @State var fridayStartTime : Date = Date()
    @State var saturdayStartTime : Date = Date()
    @State var sundayStartTime : Date = Date()
    
    
    
    // end times
    
    @State var mondayEndTime : Date = Date()
    @State var tusedayEndTime : Date = Date()
    @State var wednesdayEndTime : Date = Date()
    @State var thursdayEndTime : Date = Date()
    @State var fridayEndTime : Date = Date()
    @State var saturdayEndTime : Date = Date()
    @State var sundayEndTime : Date = Date()

    
    
    @Binding var isAvailablilityHourseSetUpActive : Bool
    
    
    init (isAvailablilityHourseSetUpActive : Binding<Bool>){
        self._isAvailablilityHourseSetUpActive = isAvailablilityHourseSetUpActive
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
                    
                    Text("Availability & Hours")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    CircularProgressView(progress: 69)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                HStack(spacing:0){
                    
                    Text("Hours of Operation\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(.red))")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    // monday group
                    Group{
                        
                        Toggle("Monday", isOn: self.$mondayToggle)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                        
                        if(self.mondayToggle){
                            
                            HStack{
                                
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Start Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $mondayStartTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                    
                                    

                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("End Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $mondayEndTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                 
                                    
                                }
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                            
                        }
                        
                        Divider()
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                    }
                    
                    
                    // tuseday group
                    Group{
                        
                        Toggle("Tuseday", isOn: self.$tusedayToggle)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                        
                        if(self.tusedayToggle){
                            
                            HStack{
                                
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Start Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $tusedayStartTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                    
                                    

                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("End Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $tusedayEndTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                 
                                    
                                }
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                            
                        }
                        
                        Divider()
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                    }
                    
                    
                    
                    // wednesday group
                    Group{
                        
                        Toggle("Wednesday", isOn: self.$wednesdayToggle)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                        
                        if(self.wednesdayToggle){
                            
                            HStack{
                                
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Start Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $wednesdayStartTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                    
                                    

                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("End Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $wednesdayEndTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                 
                                    
                                }
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                            
                        }
                        
                        Divider()
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                    }
                    
                    
                    
                    // thursday group
                    Group{
                        
                        Toggle("Thursday", isOn: self.$thursdayToggle)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                        
                        if(self.thursdayToggle){
                            
                            HStack{
                                
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Start Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $thursdayStartTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                    
                                    

                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("End Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $thursdayEndTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                 
                                    
                                }
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                            
                        }
                        
                        Divider()
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                    }
                    
                    
                    
                    // friday group
                    Group{
                        
                        Toggle("Friday", isOn: self.$fridayToggle)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                        
                        if(self.fridayToggle){
                            
                            HStack{
                                
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Start Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $fridayStartTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                    
                                    

                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("End Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $fridayEndTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                 
                                    
                                }
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                            
                        }
                        
                        Divider()
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                    }
                    
                    
                    
                    // saturday group
                    Group{
                        
                        Toggle("Saturday", isOn: self.$saturdayToggle)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                        
                        if(self.saturdayToggle){
                            
                            HStack{
                                
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Start Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $saturdayStartTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                    
                                    

                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("End Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $saturdayEndTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                 
                                    
                                }
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                            
                        }
                        
                        Divider()
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                    }
                    
                    
                    
                    // sunday group
                    Group{
                        
                        Toggle("Sunday", isOn: self.$sundayToggle)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                        
                        if(self.sundayToggle){
                            
                            HStack{
                                
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Start Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $sundayStartTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                    
                                    

                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("End Time")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    DatePicker("", selection: $sundayEndTime , displayedComponents: .hourAndMinute)
                                        .accentColor(AppColors.textColorLight)
                                                 .labelsHidden()
                                 
                                    
                                }
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                            
                        }
                        
                        Divider()
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .padding(.top,10)
                        
                    }
                    
                    
                }
                .clipped()
                
                GradientButton(lable: "Save")
                    .padding(.leading , 15)
                    .padding(.trailing,15)
                    .padding(.bottom,10)
                    .padding(.top,10)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
    }
}


