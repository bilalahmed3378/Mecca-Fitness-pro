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
    
    
    init(availability : Binding<ViewAvailabilityModel>){
        self._availability = availability
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
                    
                    Button(action: {
                        
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
                    
                    
                    Spacer()
                    
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
    
}
