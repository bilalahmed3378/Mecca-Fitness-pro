//
//  BookingProfessionalProfileScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//

import SwiftUI

struct VisitorProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var images : Array<String> = [AppImages.profileImageMen , AppImages.profileImageGirl , AppImages.homeListItemImage , AppImages.profileImageGirl]
    
    @State var specializationsList : Array<String> = ["Weight Loss" , "Muscle Gain" , "AC" , "Yoga" ]
    
    
    @State private var selection = 0
    
    @State private var messageViewActive : Bool = false

    
    @Binding var isFlowRootActive : Bool
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    
    var body: some View {
        
        
        
        ZStack{
            
            VStack{
                TabView(selection : $selection){
                                
                    ForEach(0...(images.count-1) , id:\.self){ i in
                                    Image("\(images[i])")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*80)
                                }

                                
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*80)
                Spacer()
            }
            .onAppear{
                UIPageControl.appearance().currentPageIndicatorTintColor = .red
                UIPageControl.appearance().pageIndicatorTintColor = .white
            }
            
            
            VStack{
                
                
                HStack{
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(uiImage: UIImage(named: AppImages.backIcon)!)
                    }
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                
                
                Spacer()
                
                HStack(spacing:5){
                    ForEach(0...(images.count-1) , id: \.self){ index in
                        Circle()
                            .fill(self.selection == index ? AppColors.primaryColor : .white)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)
                
                VStack{
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        VStack(spacing:0){
                            
                            // user details
                            HStack(alignment:.top){
                                
                                VStack(alignment:.leading , spacing:8){
                                    Text("Ema Watson")
                                        .font(AppFonts.ceraPro_20)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    HStack{
                                        
                                        Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                        
                                        
                                        Text("Washington, USA")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }
                                
                                Spacer()
                                
                                VStack{
                                    
//                                    NavigationLink(destination: SingleChatScreen(isFlowRootActive: self.$messageViewActive), isActive : self.$messageViewActive){
//                                        
//                                        Image(uiImage: UIImage(named: AppImages.messageBoxIcon)!)
//                                    }
                                    
                                }
                                
                            }
                            .padding(.top,30)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            
                            //date time group
                            Group{
                                
                                HStack{
                                    Text("Date & Time")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    
                                }
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                HStack{
                                    Text("August 16, 2021  |  02:00 PM")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(AppColors.textColorLight)
                                    Spacer()
                                    
                                }
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                               
                                
                                
                            }
                            
                            
                            
                            
                        }
                         
                        
                    }
                    .overlay(DisolvingEffect()
                    .padding(.leading,20)
                    .padding(.trailing,20))
                    
                    HStack{
                        
                        GradientButton(lable: "Accept")
                            .padding(.trailing,5)
                            
                        
                        NavigationLink(destination: BookingCancelConfirmationScreen(isFlowRootActive: self.$isFlowRootActive)){
                            
                            HStack{
                                
                                Spacer()
                                
                                Text("Reject")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                            .shadow(radius: 10)
                        }
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    
                    
                }
                .frame(width: UIScreen.screenWidth , height: (UIScreen.heightBlockSize*30))
                .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
            }
            

            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        
        
    }
}


