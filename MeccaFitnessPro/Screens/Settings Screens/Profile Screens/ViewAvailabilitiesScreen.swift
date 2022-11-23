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
                                
                                AvailabilityDayView(availability: (self.$viewAvailabilitiesApi.apiResponse.data[index]))
                                
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
    
    @StateObject var addNewAvailabilityApi = AddNewAvaialbilityApi()

    @State var showSheet : Bool = false
    @State var showTimeError : Bool = false
    @State var timeError : String = "Please select valid time period. Start time must be less than end time."
    @State var fromTime : Date = Date()
    @State var toTime : Date = Date()
    
    
    let formatter = DateFormatter()
   
    
    init(availability : Binding<ViewAvailabilityModel>){
        self._availability = availability
        formatter.dateFormat = "hh:mm aa"
    }
    
    var body: some View{
        
        
        VStack{
            
            Toggle(self.availability.day.capitalizingFirstLetter(), isOn: self.$availability.dayOn)
                .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                .padding(.leading,15)
                .padding(.trailing,15)
                .padding(.top,10)
                .onChange(of: self.availability.dayOn) { newValue in
                   
                }
               
            
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
                            
                           
                            
                            
                            ForEach(self.availability.avail , id:\.self){ availability in
                                
                                HStack{
                                    
                                    VStack{
                                        
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.grey500)
                                        
                                        Text(self.formatter.string(from: availability.from_time))
                                            .font(AppFonts.ceraPro_14)
                                            .padding(8)
                                            .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.grey200))
                                        
                                    }
                                    
                                    VStack{
                                        
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.grey500)
                                        
                                        Text(self.formatter.string(from: availability.to_time))
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
                                            Button(action: {
                                                
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
                       if (self.fromTime == toTime){
                           self.showTimeError = true
                       }
                       else{
                           self.availability.avail.insert(AvailabilityModel(availability_id: 0, from_time: self.fromTime, to_time: self.toTime, new: true), at : 0)
                           self.showSheet = false
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
