//
//  ViewAvailabilitiesScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/11/2022.
//

import SwiftUI

struct ViewAvailabilitiesScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewAvailabilitiesApi = ViewAvailabilitiesApi()
    @StateObject var addNewAvailabilityApi = AddNewAvaialbilityApi()

    @State var showToast  : Bool = false
    @State var toastMessage  : String = ""

    
    // day toggles
    @State var mondayToggle  : Bool = false
    @State var tusedayToggle  : Bool = false
    @State var wednesdayToggle  : Bool = false
    @State var thursdayToggle  : Bool = false
    @State var fridayToggle  : Bool = false
    @State var saturdayToggle  : Bool = false
    @State var sundayToggle  : Bool = false
    
    
//    @State var workingAvailabilities : [WorkingAvailability] = []
    
    @Binding var isFlowRouteActive : Bool
    
    init(isFlowRouteActive : Binding<Bool>){
        self._isFlowRouteActive = isFlowRouteActive
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
                    
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                HStack{
                    
                    Text("Hours of Operation")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.grey500)
                    
                    Spacer()
                }
                .padding(.leading , 20)
                .padding(.top, 10)
                
                
                
                if (self.viewAvailabilitiesApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        VStack{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 20)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 40, fill: AppColors.grey300)
                                    .frame(width: 40, height: 25)
                                
                            }
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40), height: 1)
                                .padding(.top,10)
                            
                        }
                        
                        
                        VStack{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 20)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 40, fill: AppColors.grey300)
                                    .frame(width: 40, height: 25)
                                
                            }
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40), height: 1)
                                .padding(.top,10)
                            
                        }
                       
                        
                        
                        VStack{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 20)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 40, fill: AppColors.grey300)
                                    .frame(width: 40, height: 25)
                                
                            }
                            
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40), height: 1)
                                .padding(.top,10)
                            
                        }
                        
                        
                        
                        VStack{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 20)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 40, fill: AppColors.grey300)
                                    .frame(width: 40, height: 25)
                                
                            }
                            
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40), height: 1)
                                .padding(.top,10)
                            
                        }
                        
                        
                        
                        VStack{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 20)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 40, fill: AppColors.grey300)
                                    .frame(width: 40, height: 25)
                                
                            }
                            
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40), height: 1)
                                .padding(.top,10)
                            
                        }
                        
                        
                        
                        VStack{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 20)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 40, fill: AppColors.grey300)
                                    .frame(width: 40, height: 25)
                                
                            }
                            
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40), height: 1)
                                .padding(.top,10)
                            
                        }
                        
                        
                        
                        VStack{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 20)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 40, fill: AppColors.grey300)
                                    .frame(width: 40, height: 25)
                                
                            }
                            
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40), height: 1)
                                .padding(.top,10)
                            
                        }
                       
                        
                    }
                    
                    
                }
                else if(self.viewAvailabilitiesApi.isApiCallDone && self.viewAvailabilitiesApi.isApiCallSuccessful){
                    if(self.viewAvailabilitiesApi.dataRetrivedSuccessfully){
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                            ForEach(self.viewAvailabilitiesApi.apiResponse.data.indices , id:\.self){ index in
                                
                                AvailabilityDayView(availability: (self.$viewAvailabilitiesApi.apiResponse.data[index]) , showToast: self.$showToast , toastMessage: self.$toastMessage)
                                
                            }
                            
                        }
                        
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to get availabilites. Please try again.")
                        
                        Spacer()
                            .frame( height: 40)
                        
                        Button(action: {
                            
                            self.viewAvailabilitiesApi.getAvailabiliries()
                            
                        }){
                            
                            Text("Try Again")
                                .foregroundColor(Color.white)
                                .padding()
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                            
                        }
                        
                        Spacer()
                    }
                }
                else if(self.viewAvailabilitiesApi.isApiCallDone && (!self.viewAvailabilitiesApi.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                    
                    Spacer()
                        .frame( height: 40)
                    
                    Button(action: {
                        
                        self.viewAvailabilitiesApi.getAvailabiliries()
                        
                    }){
                        
                        Text("Try Again")
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        
                    }
                    
                    Spacer()
                }
                else{
                    
                    Spacer()
                    
                    Text("Unable to get availabilites. Please try again.")
                    
                    Spacer()
                        .frame( height: 40)
                    
                    Button(action: {
                        
                        self.viewAvailabilitiesApi.getAvailabiliries()
                        
                    }){
                        
                        Text("Try Again")
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        
                    }
                    
                    Spacer()
                    
                }
                
                
                if(self.addNewAvailabilityApi.isLoading){
                    ProgressView()
                        .padding(20)
                        .onDisappear{
                            if(self.addNewAvailabilityApi.isApiCallDone && self.addNewAvailabilityApi.isApiCallSuccessful){
                                if(self.addNewAvailabilityApi.addedSuccessfully){
                                    self.toastMessage = "Availablities saved successfully."
                                    self.showToast = true
                                    self.viewAvailabilitiesApi.getAvailabiliries()
                                }
                                else{
                                    self.toastMessage = "Unable to save avilabilities changes. Please try agin later."
                                    self.showToast = true
                                }
                            }
                            else if(self.addNewAvailabilityApi.isApiCallDone && (!self.addNewAvailabilityApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                self.showToast = true
                            }
                        }
                }
                else {
                    Button(action: {
                        withAnimation{
                            do{
                                let formatter = DateFormatter()
                                formatter.dateFormat = "HH:mm"
                                var days : [AddNewAvailabilityDayModel] = []
                                for day in self.viewAvailabilitiesApi.apiResponse.data{
                                    var availabilities : [AddNewAvailabilityModel] = []
                                    for availability in day.avail{
                                        if(availability.new){
                                            availabilities.append(AddNewAvailabilityModel(from: formatter.string(from: availability.from_time), to: formatter.string(from: availability.to_time)))
                                        }
                                    }
                                    if(!availabilities.isEmpty){
                                        days.append(AddNewAvailabilityDayModel(day: day.day.capitalizingFirstLetter() , availabilities: availabilities))
                                    }
                                }
                                if(!days.isEmpty){
                                    let dataToApi = try JSONEncoder().encode(AddNewAvailabilityRequestModel(data: days))
                                    self.addNewAvailabilityApi.addAvailabiliries(dataToApi: dataToApi)
                                }
                                else{
                                    self.toastMessage = "No changes to save."
                                    self.showToast = true
                                }
                            }
                            catch{
                                self.toastMessage = "Got encoding error."
                                self.showToast = true
                            }
                        }
                    }){
                        GradientButton(lable: "Save Changes")
                    }
                    .padding(20)
                }
                
                
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
                        
        }
        .navigationBarHidden(true)
        .onAppear{
            if(self.viewAvailabilitiesApi.apiResponse.data.isEmpty){
                self.viewAvailabilitiesApi.getAvailabiliries()
            }
        }
        
        
    }
    
}


struct AvailabilityDayView : View {
    
    
    @Binding var availability : ViewAvailabilityModel
    @Binding var showToast : Bool
    @Binding var toastMessage : String
        
    @StateObject var deleteAvailbilityApi = DeleteAvaialbilityApi()
    
    @State var showSheet : Bool = false
    @State var showTimeError : Bool = false
    @State var timeError : String = "Please select valid time period. Start time must be less than end time."
    @State var fromTime : Date = Date()
    @State var toTime : Date = Date()
    
    
    let formatter = DateFormatter()
    
    @State var deletingAvailbilityId : Int = 0
   
    
    init(availability : Binding<ViewAvailabilityModel> , showToast : Binding<Bool> , toastMessage : Binding<String>){
        self._availability = availability
        self._showToast = showToast
        self._toastMessage = toastMessage
        formatter.dateFormat = "hh:mm aa"
        
    }
    
    var body: some View{
        
        
        VStack{
            
            
            HStack{
                
                Text(self.availability.day.capitalizingFirstLetter())
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                
                Spacer()
                
                if(self.deleteAvailbilityApi.isLoading && (!self.availability.dayOn)){
                                        
                    ProgressView()
                        .frame(width: 40 , height: 40)
                        .progressViewStyle(CircularProgressViewStyle(tint: AppColors.primaryColor))
                        .padding(.trailing , 10)
                        .onDisappear{
                            if(self.deleteAvailbilityApi.isApiCallDone && self.deleteAvailbilityApi.isApiCallSuccessful){
                                if(self.deleteAvailbilityApi.deletedSuccessfully){
                                    self.toastMessage = "Availablities deleted successfully."
                                    self.showToast = true
                                    self.availability.avail.removeAll()
                                }
                                else{
                                    self.toastMessage = "Unable to delete avilabilities. Please try agin later."
                                    self.showToast = true
                                }
                            }
                            else if(self.deleteAvailbilityApi.isApiCallDone && (!self.deleteAvailbilityApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                self.showToast = true
                            }
                        }
                }
                else{
                    
                    Toggle("", isOn: self.$availability.dayOn)
                        .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                        .onChange(of: self.availability.dayOn) { newValue in
                            if((!newValue) && (!self.availability.avail.isEmpty)){
                                do{
                                    self.deletingAvailbilityId = 0
                                    
                                    var ids : [Int] = []
                                    
                                    for id in self.availability.avail{
                                        if(!id.new){
                                            ids.append(id.availability_id)
                                        }
                                    }
                                    
                                    if(!ids.isEmpty){
                                        let data = DeleteAvailabilitiesRequestModel(availabilities : ids)
                                        
                                        let dataToApi = try JSONEncoder().encode(data)
                                        
                                        self.deleteAvailbilityApi.deletAvailabiliries(dataToApi: dataToApi)
                                    }
                                    else{
                                        self.availability.avail.removeAll()
                                    }
                                    
                                }
                                catch{
                                    
                                }
                            }
                        }
                }
                
            }
            .padding(.leading,15)
            .padding(.trailing,15)
            .padding(.top,10)
            
               
            
            if(self.availability.dayOn){
                
                
                
                HStack{
                    
                    ScrollView(.horizontal , showsIndicators: false){
                        
                        
                        HStack{
                            
                            if(self.availability.avail.count == 6){
                                Spacer()
                                    .padding(.leading,15)
                            }
                            else{
                                Button(action: {
                                    self.showSheet = true
                                }){
                                    
                                    VStack{
                                        
                                        Image(systemName: "plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .background(Circle().fill(AppColors.grey200))
                                        
                                        Text("Add Slot")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.grey500)
                                            .padding(.top,5)
                                        
                                    }
                                    
                                }
                                .padding(.leading,15)
                            }
                            
                           
                            
                            
                            ForEach(self.availability.avail.indices , id:\.self){ index in
                                
                                HStack{
                                    
                                    VStack{
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.grey500)
                                        
                                        Text(self.formatter.string(from: self.availability.avail[index].from_time))
                                            .font(AppFonts.ceraPro_14)
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.grey200))
                                        
                                    }
                                    
                                    VStack{
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.grey500)
                                        
                                        Text(self.formatter.string(from: self.availability.avail[index].to_time))
                                            .font(AppFonts.ceraPro_14)
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.grey200))
                                        
                                    }
                                    
                                }
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 3))
                                .overlay(
                                    HStack{
                                        Spacer()
                                        VStack{
                                            
                                            if(self.deleteAvailbilityApi.isLoading && (self.deletingAvailbilityId == self.availability.avail[index].availability_id)){
                                                
                                                ProgressView()
                                                    .frame(width: 13 , height: 13)
                                                    .progressViewStyle(CircularProgressViewStyle(tint: AppColors.primaryColor))
                                                    .onDisappear{
                                                        if(self.deleteAvailbilityApi.isApiCallDone && self.deleteAvailbilityApi.isApiCallSuccessful){
                                                            if(self.deleteAvailbilityApi.deletedSuccessfully){
                                                                self.toastMessage = "Availablity deleted successfully."
                                                                self.showToast = true
                                                                self.availability.avail.remove(at: index)
                                                            }
                                                            else{
                                                                self.toastMessage = "Unable to delete avilability. Please try agin later."
                                                                self.showToast = true
                                                            }
                                                        }
                                                        else if(self.deleteAvailbilityApi.isApiCallDone && (!self.deleteAvailbilityApi.isApiCallSuccessful)){
                                                            self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                                            self.showToast = true
                                                        }
                                                    }
                                                
                                            }
                                            else{
                                                
                                                
                                                Button(action: {
                                                    if(self.availability.avail[index].new){
                                                        self.availability.avail.remove(at: index)
                                                    }
                                                    else{
                                                        
                                                        do{
                                                            self.deletingAvailbilityId = self.availability.avail[index].availability_id
                                                            
                                                            let data = DeleteAvailabilitiesRequestModel(availabilities: [self.availability.avail[index].availability_id])
                                                            
                                                            let dataToApi = try JSONEncoder().encode(data)
                                                            
                                                            self.deleteAvailbilityApi.deletAvailabiliries(dataToApi: dataToApi)
                                                            
                                                        }
                                                        catch{
                                                            
                                                        }
                                                        
                                                    }
                                                }){
                                                    Image(systemName: "minus")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 8, height: 8)
                                                        .foregroundColor(.white)
                                                        .padding(5)
                                                        .background(Circle().fill(AppColors.primaryColor))
                                                        .offset(x : 8 , y : -8)
                                                }
                                            }
                                            Spacer()
                                        }
                                    }
                                )
                                .padding(8)
                                
                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                .padding(.top,10)
                
                
            }
            
            Divider()
                .padding(.leading,15)
                .padding(.trailing,15)
                .padding(.top,10)
            
        }
        .sheet(isPresented: self.$showSheet){
            
            
            VStack(alignment: .leading){
                
                HStack{
                    
                    Text("Setup your time")
                        .font(AppFonts.ceraPro_24)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action:{
                        self.showSheet = false
                    }){
                        Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                    }
                    
                    
                }
                
                
                
                DatePicker("Start Time", selection: $fromTime , displayedComponents: .hourAndMinute)
                    .accentColor(AppColors.textColorLight)
                    .onChange(of: self.fromTime) { newValue in
                        self.timeError = "Please select valid time period. Start time must be less than end time."
                        self.showTimeError = self.fromTime >= self.toTime
                       
                    }
                .padding(.top,20)
                
                
                DatePicker("End Time", selection: $toTime , displayedComponents: .hourAndMinute)
                    .accentColor(AppColors.textColorLight)
                    .onChange(of: self.toTime) { newValue in
                        self.timeError = "Please select valid time period. Start time must be less than end time."
                        self.showTimeError = self.fromTime >= self.toTime
                    }
                    .padding(.top,20)
                
                
                if(self.showTimeError){
                    Text(self.timeError)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.red)
                        .padding(.top,20)
                }

               Button(action: {
                   
                   if(self.availability.avail.count < 6){
                       if (formatter.string(from: self.fromTime) == formatter.string(from: self.toTime)){
                           self.timeError = "From and To time can't be same."
                           self.showTimeError = true
                       }
                       else{
                           
                           let newAvil = self.availability.avail.first(where: {formatter.string(from: $0.from_time) == formatter.string(from: self.fromTime)})
                           
                           if(newAvil == nil){
                               self.availability.avail.insert(AvailabilityModel(availability_id: 0, from_time: self.fromTime, to_time: self.toTime, new: true), at : 0)
                               self.showSheet = false
                           }
                           else{
                               self.timeError = "Same time already exists."
                               self.showTimeError = true
                           }
                           
                       }
                   }
                   else{
                       self.timeError = "You can add maximum six slots in a day."
                       self.showTimeError = true
                   }
                   
               }){
                   GradientButton(lable: "Save")
               }
               .padding(.top,10)
                
                
                
                
                Spacer()
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,20)
            
        }
       
        
        
    }
    
}
