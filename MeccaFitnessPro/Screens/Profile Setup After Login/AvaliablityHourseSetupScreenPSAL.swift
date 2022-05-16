//
//  AvaliablityHourseSetupPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI
import AVFoundation

struct AvaliablityHourseSetupScreenPSAL : View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var initiateAvailableHourseApi : InitiateAvailableHourseApi  = InitiateAvailableHourseApi()

    
    @ObservedObject var updateAvailableHoursapi : UpdateAvailableHourseApi  = UpdateAvailableHourseApi()

    
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
    
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var refresh : Bool = false
    
    
    @State var hourseList : [AvailableHoureWorkingModel] = []
    
    
    
    @Binding var isAvailablilityHourseSetUpActive : Bool
    @Binding var isAvialabilitiesHoursAdded : Bool
    
    init (isAvailablilityHourseSetUpActive : Binding<Bool> , isAvialabilitiesHoursAdded : Binding<Bool>){
        self._isAvailablilityHourseSetUpActive = isAvailablilityHourseSetUpActive
        self._isAvialabilitiesHoursAdded = isAvialabilitiesHoursAdded
        
    }
    
    var body: some View {
        
        ZStack{
            
            if(refresh){
                HStack{
                    
                }
            }
            
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
                
                
                if(self.initiateAvailableHourseApi.isLoading){
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                    
                }
                else if( self.initiateAvailableHourseApi.isApiCallDone && self.initiateAvailableHourseApi.isApiCallSuccessful && self.initiateAvailableHourseApi.apiResponse != nil){
                    
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        
                        
                        // monday group
                        Group{
                            
                            Toggle("Monday", isOn: self.$mondayToggle)
                                .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                .padding(.leading,15)
                                .padding(.trailing,15)
                                .padding(.top,10)
                                .onChange(of: self.mondayToggle) { newValue in
                                    for hour in self.hourseList{
                                        if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "monday"){
                                            hour.status = 0
                                            if(newValue){
                                                hour.status = 1
                                            }
                                            break
                                        }
                                    }
                                }
                            
                            
                            if(self.mondayToggle){
                                
                                HStack{
                                    
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $mondayStartTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.mondayStartTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "monday"){
                                                        hour.startTime = newValue
                                                        break
                                                    }
                                                }
                                                
                                            }
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $mondayEndTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.mondayEndTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "monday"){
                                                        hour.endTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
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
                                .onChange(of: self.tusedayToggle) { newValue in
                                    for hour in self.hourseList{
                                        if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "tuesday"){
                                            hour.status = 0
                                            if(newValue){
                                                hour.status = 1
                                            }
                                            break
                                        }
                                    }
                                }
                            
                            if(self.tusedayToggle){
                                
                                HStack{
                                    
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $tusedayStartTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.tusedayStartTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "tuesday"){
                                                        hour.startTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $tusedayEndTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.tusedayEndTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "tuesday"){
                                                        hour.endTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
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
                                .onChange(of: self.wednesdayToggle) { newValue in
                                    for hour in self.hourseList{
                                        if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "wednesday"){
                                            hour.status = 0
                                            if(newValue){
                                                hour.status = 1
                                            }
                                            break
                                        }
                                    }
                                }
                            
                            
                            if(self.wednesdayToggle){
                                
                                HStack{
                                    
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $wednesdayStartTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.wednesdayStartTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "wednesday"){
                                                        hour.startTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $wednesdayEndTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.wednesdayEndTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "wednesday"){
                                                        hour.endTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
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
                                .onChange(of: self.thursdayToggle) { newValue in
                                    for hour in self.hourseList{
                                        if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "thursday"){
                                            hour.status = 0
                                            if(newValue){
                                                hour.status = 1
                                            }
                                            break
                                        }
                                    }
                                }
                            
                            
                            
                            if(self.thursdayToggle){
                                
                                HStack{
                                    
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $thursdayStartTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.thursdayStartTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "thursday"){
                                                        hour.startTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $thursdayEndTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.thursdayEndTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "thursday"){
                                                        hour.endTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
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
                                .onChange(of: self.fridayToggle) { newValue in
                                    for hour in self.hourseList{
                                        if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "friday"){
                                            hour.status = 0
                                            if(newValue){
                                                hour.status = 1
                                            }
                                            break
                                        }
                                    }
                                }
                            
                            
                            
                            if(self.fridayToggle){
                                
                                HStack{
                                    
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $fridayStartTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.fridayStartTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "friday"){
                                                        hour.startTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $fridayEndTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.fridayEndTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "friday"){
                                                        hour.endTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
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
                                .onChange(of: self.saturdayToggle) { newValue in
                                    for hour in self.hourseList{
                                        if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "satuarday"){
                                            hour.status = 0
                                            if(newValue){
                                                hour.status = 1
                                            }
                                            break
                                        }
                                    }
                                }
                            
                            if(self.saturdayToggle){
                                
                                HStack{
                                    
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $saturdayStartTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.saturdayStartTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "satuarday"){
                                                        hour.startTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $saturdayEndTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.saturdayEndTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "satuarday"){
                                                        hour.endTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
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
                                .onChange(of: self.sundayToggle) { newValue in
                                    for hour in self.hourseList{
                                        if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "sunday"){
                                            hour.status = 0
                                            if(newValue){
                                                hour.status = 1
                                            }
                                            break
                                        }
                                    }
                                }
                            
                            if(self.sundayToggle){
                                
                                HStack{
                                    
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $sundayStartTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.sundayStartTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "sunday"){
                                                        hour.startTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        DatePicker("", selection: $sundayEndTime , displayedComponents: .hourAndMinute)
                                            .accentColor(AppColors.textColorLight)
                                            .labelsHidden()
                                            .onChange(of: self.sundayEndTime) { newValue in
                                                for hour in self.hourseList{
                                                    if(hour.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "sunday"){
                                                        hour.endTime = newValue
                                                        break
                                                    }
                                                }
                                            }
                                        
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
                    .onAppear{
                        
                        if(self.initiateAvailableHourseApi.dataRetrivedSuccessfully){
                            
                            
                            for houre in self.initiateAvailableHourseApi.apiResponse!.data{
                                
                                let day = AvailableHoureWorkingModel(availability_id: houre.availability_id, day: houre.day, from_time: houre.from_time, to_time: houre.to_time, status: houre.status)
                                
                                if(day.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "monday"){
                                    
                                    if(day.status == 1){
                                        self.mondayToggle = true
                                    }
                                    else{
                                        self.mondayToggle = false
                                    }
                                    self.mondayStartTime = day.startTime
                                    self.mondayEndTime = day.endTime
                                    
                                }
                                else if ( day.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "tuesday"){
                                    if(day.status == 1){
                                        self.tusedayToggle = true
                                    }
                                    else{
                                        self.tusedayToggle = false
                                    }
                                    self.tusedayStartTime = day.startTime
                                    self.tusedayEndTime = day.endTime
                                }
                                else if ( day.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "wednesday"){
                                    if(day.status == 1){
                                        self.wednesdayToggle = true
                                    }
                                    else{
                                        self.wednesdayToggle = false
                                    }
                                    self.wednesdayStartTime = day.startTime
                                    self.wednesdayEndTime = day.endTime
                                }
                                else if ( day.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "thursday"){
                                    if(day.status == 1){
                                        self.thursdayToggle = true
                                    }
                                    else{
                                        self.thursdayToggle = false
                                    }
                                    self.thursdayStartTime = day.startTime
                                    self.thursdayEndTime = day.endTime
                                }
                                else if ( day.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "friday"){
                                    if(day.status == 1){
                                        self.fridayToggle = true
                                    }
                                    else{
                                        self.fridayToggle = false
                                    }
                                    self.fridayStartTime = day.startTime
                                    self.fridayEndTime = day.endTime
                                }
                                else if ( day.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "satuarday"){
                                    if(day.status == 1){
                                        self.saturdayToggle = true
                                    }
                                    else{
                                        self.saturdayToggle = false
                                    }
                                    self.saturdayStartTime = day.startTime
                                    self.saturdayEndTime = day.endTime
                                }
                                else if ( day.day.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "sunday"){
                                    if(day.status == 1){
                                        self.sundayToggle = true
                                    }
                                    else{
                                        self.sundayToggle = false
                                    }
                                    self.sundayStartTime = day.startTime
                                    self.sundayEndTime = day.endTime
                                }
                                
                                
                                self.hourseList.append( day )
                                
                                
                            }
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    if(self.updateAvailableHoursapi.isLoading){
                        
                        HStack{
                            
                            Spacer()
                            
                            ProgressView()
                            
                            Spacer()
                            
                        }
                        .padding(.leading , 15)
                        .padding(.trailing,15)
                        .padding(.bottom,10)
                        .padding(.top,10)
                        
                    }
                    else{
                        
                        Button(action: {
                            
                            if !(self.hourseList.isEmpty){
                             
                                do{
                                    
                                    var dataList = [AvailableHourRequestModel]()
                                    
                                    for hour in self.hourseList{
                                        
                                        let start_hour : String = String(Calendar.current.component(.hour, from: hour.startTime))
                                        let start_minute = String(Calendar.current.component(.minute, from: hour.startTime))
                                        
                                        let end_hour = String(Calendar.current.component(.hour, from: hour.endTime))
                                        let end_minute = String(Calendar.current.component(.minute, from: hour.endTime))
                                        
                                        var status = false
                                        
                                        if(hour.status == 1){
                                            status = true
                                        }
                                        
                                        dataList.append(AvailableHourRequestModel(availability_id: hour.availability_id, from: "\(start_hour):\(start_minute)" , to: "\(end_hour):\(end_minute)", status: status))
                                    }

                                    let dataToApi = UpdateAvailableHourRequestModel(availabilities: dataList)

                                    let newDataToApi = try JSONEncoder().encode(dataToApi)
                                    
                                    self.updateAvailableHoursapi.updateHours(dataToApi: newDataToApi)

                                    
                                    
                                }
                                catch{
                                    
                                    self.toastMessage = "Unknow error while updating available hours."
                                    self.showToast = true
                                    
                                }
                                 
                            }
                            else{
                                self.toastMessage = "Unknow error while updating available hours."
                                self.showToast = true
                            }
                            
                            
                            
                        }){
                            
                            GradientButton(lable: "Save")
                            
                        }
                        .padding(.leading , 15)
                        .padding(.trailing,15)
                        .padding(.bottom,10)
                        .padding(.top,10)
                        .onAppear{
                            
                            if(self.updateAvailableHoursapi.isApiCallDone && self.updateAvailableHoursapi.isApiCallSuccessful){
                                
                                if(self.updateAvailableHoursapi.updatedSuccessfully){
                                    
                                    self.toastMessage = "Avaialable Hours successfully."
                                    self.showToast = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        self.isAvialabilitiesHoursAdded = true
                                        self.isAvailablilityHourseSetUpActive = false
                                    }
                                   
                                }
                                else if(self.updateAvailableHoursapi.apiResponse != nil){
                                    self.toastMessage = self.updateAvailableHoursapi.apiResponse!.message
                                    self.showToast = true
                                }
                                else{
                                    self.toastMessage = "Unable to update available hours. Please try again later."
                                    self.showToast = true
                                }
                            }
                            else if(self.updateAvailableHoursapi.isApiCallDone && (!self.updateAvailableHoursapi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                self.showToast = true
                            }
                            
                            
                            
                        }
                        
                    }
                    
                }
                else if(self.initiateAvailableHourseApi.isApiCallDone && (!self.initiateAvailableHourseApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Button(action: {
                        
                        self.initiateAvailableHourseApi.initiate()
                        
                    }){
                        
                        Text("Try Again")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                    .padding(.top,20)
                    
                    
                    Spacer()
                    
                }
                else {
                    
                    Spacer()
                    
                    Text("Unable to load available hours. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Button(action: {
                        
                        self.initiateAvailableHourseApi.initiate()
                        
                    }){
                        
                        Text("Try Again")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                    .padding(.top,20)
                    
                    
                    Spacer()
                    
                }
               
                
            }
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.initiateAvailableHourseApi.initiate()
        }
    }
}


