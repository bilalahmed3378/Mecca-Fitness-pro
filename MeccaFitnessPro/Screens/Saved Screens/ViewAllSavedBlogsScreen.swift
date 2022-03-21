//
//  ViewAllSavedBlogsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 10/03/2022.
//

import SwiftUI

struct ViewAllSavedBlogsScreen: View {
    
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
                
                
                
                Text("Blogs")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                
                
                // scroll view content container
                ScrollView(.vertical,showsIndicators: false){
                    
                    LazyVStack{
                        ForEach(0...10, id : \.self){index in
                            BlogCard()
                        }
                    }
                    
                }
                .padding(.top,10)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct BlogCard : View{
    
    
    var body: some View{
        
        HStack{
            
            // user image
            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(12)
            
            
            // name date profession
            VStack(alignment:.leading){
                
                Text("Tourism")
                    .font(AppFonts.ceraPro_10)
                    .foregroundColor(AppColors.mainYellowColor)
                    .lineLimit(1)
                    
                
                Text("Ema Watson")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .padding(.top,5)
                
                HStack{
                    Image(uiImage: UIImage(named: AppImages.timeDarkIcon)!)
                        .foregroundColor(.black)
                    Text("June 8, 2020")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.top,5)
                
            }
            .padding(.leading,5)
            
            // book mark icon
            Button(action: {
                
            }){
                Image(uiImage: UIImage(named: AppImages.bookMarkSelectedIconDark)!)
            }
            
        }
        .padding()
        .frame(width: UIScreen.screenWidth-40)
        .background(AppColors.grey100)
        .cornerRadius(20)
        .padding(.top,20)
        
    }
    
}
