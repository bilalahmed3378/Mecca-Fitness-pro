//
//  ViewAllEventsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/04/2022.
//

import SwiftUI

struct ViewAllEventsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var isAddEventActive : Bool = false

    
   
    
    
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
                    
                    
                    Text("Events")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                   Spacer()
                    
                    NavigationLink(destination: AddEventScreen(isFlowRootActive: self.$isAddEventActive), isActive: self.$isAddEventActive ){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                 
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)

                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    HStack{
                        
                        Text("Events")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    ForEach(0...2, id:\.self){index in
                        
                        
                        MyEventCard()
                            
                        
                    }
                    
                    
                    
                    
                    HStack{
                        
                        Text("Upcomming")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    ForEach(0...3 , id:\.self){index in
                        
                        UpcommingEventCard()
                        
                        
                    }
                    
                    
                    
                    HStack{
                        
                        Text("All")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    ForEach(0...10 , id:\.self){index in
                        
                        UpcommingEventCard()
                        
                        
                    }
                    
                    
                    
                }
                
                
              
                
            }
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}




private struct MyEventCard : View{
    
    
    var body: some View{
        
        
        HStack{
            
            // shop image
            Image(uiImage: UIImage(named: AppImages.offerImage)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            
            
            VStack(alignment:.leading){
                
                
                Text("Weightlifting")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .lineLimit(1)
                .padding(.top,5)
                
                
                HStack{
                    Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                        .foregroundColor(AppColors.textColor)
                    Text("June 8, 2020")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.top,5)
                
                    
                HStack{
                    Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                        .foregroundColor(AppColors.textColor)
                    Text("Washington, USA")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.top,5)
                
              
                
            }
            .padding(.leading,5)
            
            
            Button(action: {
                
            }){
                Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
            }
            
            
        }
        .padding()
        .frame(width: UIScreen.screenWidth-40)
        .background(AppColors.grey100)
        .cornerRadius(20)
        .padding(.top,5)
        
        
    }
    
}



private struct UpcommingEventCard : View{
    
    
    
    var body: some View{
        
        
        HStack{
            
            // shop image
            Image(uiImage: UIImage(named: AppImages.offerImage)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            
            
            VStack(alignment:.leading){
                
                
                HStack{
                    
                    Text("Weightlifting")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text("$25")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    
                }
                .padding(.top,5)
                
                
                HStack{
                    
                    
                    VStack{
                        
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                                .foregroundColor(AppColors.textColor)
                            Text("June 8, 2020")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            Spacer()
                        }
                        .padding(.top,5)
                        
                            
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                .foregroundColor(AppColors.textColor)
                            Text("Washington, USA")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            Spacer()
                        }
                        .padding(.top,5)
                        
                    }
                    
                    
                    Text("Register")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(.black)
                        .padding(15)
                        .frame(width: 80)
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey300))
                    
                    
                }
                
              
                
            }
            .padding(.leading,5)
            
            
            
        }
        .padding()
        .frame(width: UIScreen.screenWidth-40)
        .background(AppColors.grey100)
        .cornerRadius(20)
        .padding(.top,5)
        
        
    }
    
}
