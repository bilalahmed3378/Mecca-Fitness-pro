//
//  ViewAllSavedProfessionalsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 10/03/2022.
//

import SwiftUI

struct ViewAllSavedProfessionalsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
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
                    
                    Text("Saved")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                Text("Professionals")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                
                
                // scroll view content container
                ScrollView(.vertical,showsIndicators: false){
                    
                    LazyVStack{
                        ForEach(0...10, id : \.self){index in
                            CertifiedProfessionalCard()
                        }
                    }
                    
                }
                .padding(.top,10)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct CertifiedProfessionalCard : View {
    
    @State var isViewAllProfessionalActive : Bool = false
    
    var body: some View{
        
//        NavigationLink(destination: ViewProfessionalsProfileScreen(isFlowRootActive: self.$isViewAllProfessionalActive) , isActive: self.$isViewAllProfessionalActive){
        
            
            VStack{
                
                Spacer()
                
                // user details
                HStack{
                    
                    // user image
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 100)
                        .cornerRadius(20)
                    
                    // user details
                    
                    VStack{
                        
                        // user name and certificate logo
                        HStack{
                            Text("James Daniel")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                                .lineLimit(1)
                                .padding(.trailing,5)
                            Spacer()
                            Image(AppImages.certificateLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                        }
                        
                        // rating star
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.rattingYellowFillStart)!)
                            Text("5.0")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.top,3)
                        
                        
                        // Prof Type
                        HStack{
                            Text("Prof Type")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        // experience and rate
                        HStack{
                            Text("Exp: 12 Years")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            Spacer()
                            Text("$55.00/\(Text("Hour").font(AppFonts.ceraPro_10))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                        .padding(.top,5)
                        
                    }
                    .padding(.leading,5)
                    
                       
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                Spacer()
                
                // sevices
                HStack{
                    Text("Weight Loss")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey300))
                    
                    Text("Free Classes")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey300))
                    
                    Text("10 Days Classes")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey300))
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                Spacer()
                
            }
            .frame(width: (UIScreen.screenWidth - 40), height: 210)
            .background(AppColors.grey100)
            .cornerRadius(20)
            .padding(.top,20)
        
//        }
        
        
    }
    
}
