//
//  KliquesPostViewScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/03/2022.
//

import SwiftUI

struct KliquesPostViewScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    
    
    var body: some View {
        
        
        
        
        ZStack{
            
            VStack{
                
                
                HStack{
                    
                    Button(action: {
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }){
                        
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                            .onTapGesture{
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                    
                    
                    
                    
                    Spacer()
                    
                    
                    
                    
                    Text("Kliques")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                  
                    
                    Spacer()
                    
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10)
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    VStack{
                        
                        
                        
                        
                        
                        PostView()
                            
                        
                        
                        ForEach(0...15, id:\.self){index in
                            
                            CommentView()
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                }
                        
            }
            
         
        }
        .navigationBarHidden(true)
        
    }
}



private struct PostView : View{
    
    
    var body: some View{
        
        
        VStack(alignment: .leading){
            
            Image(AppImages.fitnessEventImage)
                .resizable()
                .scaledToFill()
                .frame(width: (UIScreen.screenWidth-40) , height: 150)
                .cornerRadius(12)
            
            
            HStack{
                
                Image(AppImages.profileImageGirl)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                
                Text("Ema Jackson")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,10)
              
                
            }
            .padding(.top,10)
            
            Text("What is the best way to gain weight?")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(.black)
                .padding(.top,10)
            
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                .font(AppFonts.ceraPro_14)
                .foregroundColor(AppColors.textColor)
                .lineLimit(5)
                .padding(.top,5)
            
            
            HStack{
                
                Text("Jan 7, 2021")
                    .font(AppFonts.ceraPro_10)
                    .foregroundColor(AppColors.textColor)
                
                Spacer()
                
                Text("10 Contributors")
                    .font(AppFonts.ceraPro_10)
                    .foregroundColor(AppColors.textColor)
                
                
                
            }
            .padding(.top,2)
            
            
            Divider()
                .padding(.top,10)
            
            HStack{
                
                // like button group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesLikeIcon)!)
                    
                    Text("35k")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Spacer()
                    
                }
                
                
                // dislike button group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesDislikeIcon)!)
                    
                    Text("105")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Spacer()
                    
                }
                
                
                //   comment group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesCommentIcon)!)
                    
                    Text("15k")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Spacer()
                    
                }
                
                
                
                
                //   share group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesShareIcon)!)
                    
                    Spacer()
                    
                }

                
                
                //   bookmark group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesBookmarkIcon)!)
                    
                    Spacer()
                    
                }
                
                
                
                
                //   options group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesPostOptionsIcon)!)
                    
                    
                }

                
                
                
            }
            .padding(.top,10)
            
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        .padding(.top,20)
        
        
    }
    
}



private struct CommentView : View{
    
    
    var body: some View{
        
        
        VStack(alignment: .leading){
            
          
            
            HStack{
                
                Image(AppImages.profileImageGirl)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                
                Text("Ema Jackson")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,10)
              
                
                Image(uiImage: UIImage(named: AppImages.rattingYellowFillStart)!)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 14, height: 14)
                
                
            }
            .padding(.top,10)
         
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                .font(AppFonts.ceraPro_14)
                .foregroundColor(AppColors.textColor)
                .lineLimit(5)
                .padding(.top,2)
            
            
            HStack{
                
                Text("Jan 7, 2021")
                    .font(AppFonts.ceraPro_10)
                    .foregroundColor(AppColors.textColor)
                
                Spacer()
                
            }
            .padding(.top,2)
            
            
            Divider()
                .padding(.top,5)
            
            HStack{
                
                // like button group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesLikeIcon)!)
                    
                    Text("35k")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                }
                
                
                // dislike button group
                Group{
                    
                    Image(uiImage: UIImage(named: AppImages.kliquesDislikeIcon)!)
                        .padding(.leading,10)
                    
                    Text("105")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Spacer()
                    
                }
                
            }
            .padding(.top,5)
            
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        .padding(.top,20)
        
        
    }
    
}
