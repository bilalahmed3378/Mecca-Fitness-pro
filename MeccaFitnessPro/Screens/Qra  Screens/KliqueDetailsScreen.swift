//
//  KliqueDetailsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/03/2022.
//

import SwiftUI

struct KliqueDetailsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var message : String = ""
    
    @State var joined : Bool = false
    
    
    @State var inviting : Bool = false
    
    @State var showBottomSheet : Bool = false
    @State var isPoolView : Bool = false
    
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    VStack{
                        
                        
                        Image(AppImages.fitnessEventImage)
                            .resizable()
                            .frame(width: UIScreen.screenWidth, height: 250)
                            .scaledToFill()
                            .overlay(
                                VStack{
                                    
                                    HStack{
                                        
                                        Button(action: {
                                            presentationMode.wrappedValue.dismiss()
                                        }){
                                            Image(uiImage: UIImage(named: AppImages.backIcon)!)
                                        }
                                        
                                        Spacer()
                                        
                                      
                                        
                                        
                                        if(self.joined){
                                            Button(action: {
                                                self.isPoolView = false
                                                self.showBottomSheet = true
                                            }){
                                                Image(uiImage: UIImage(named: AppImages.optionIcon)!)
                                            }
                                        }
                                        
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top, 10)
                                    
                                    Spacer()
                                }
                            )
                        
                        
                        
                        
                        HStack{
                            
                            Text("CCHS C/O 2K")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            
                            Image(uiImage: UIImage(named: AppImages.kliquesIconRed)!)
                            
                            Text("125k Members")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.primaryColor)
                            
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                    
                        
                        HStack{
                            
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Spacer()
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        HStack{
                            
                            
                            HStack{
                                
                                Spacer()
                                Text("Join")
                                    .foregroundColor(.white)
                                    .font(AppFonts.ceraPro_14)
                                Spacer()
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                            .padding(.trailing,10)
                            .onTapGesture{
                                withAnimation{
                                    self.joined.toggle()
                                }
                            }
                            
                            
                            
                            
                            NavigationLink(destination: InviteKliquesScreen(isFlowRootActive: self.$inviting), isActive: self.$inviting){
                               
                                GradientButton(lable: "Invite")
                                
                            }
                            .padding(.leading,10)
                            
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                
                                ForEach(0...10 , id:\.self){index in
                                    
                                    Text("Post")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.top,10)
                                        .padding(.bottom,10)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey300))
                                        .padding(.leading,20)
                                    
                                }
                                
                                
                            }
                            
                        }
                        .padding(.top,10)
                        
                        
                        if !(self.joined){
                          
                            Image(uiImage: UIImage(named: AppImages.lockIconLarge)!)
                                .padding(.top,30)
                                                    
                            
                        }
                        else{
                            
                            
                            HStack{
                                
                                Image(uiImage: UIImage(named: AppImages.chatOptionsIcon)!)
                                
                                Image(uiImage: UIImage(named: AppImages.kliquesOptionsIcon)!)
                                    .padding(.leading,5)
                                
                                Image(uiImage: UIImage(named: AppImages.chatImageIcon)!)
                                    .padding(.leading,5)
                                
                                HStack{
                                    
                                    TextField("Aa" , text: self.$message)
                                        .autocapitalization(.sentences)
                                    
                                    Image(uiImage: UIImage(named: AppImages.chatEmojiIcon)!)
                                        .padding(.leading,3)
                                    
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 18).fill(AppColors.grey200))
                                .padding(.leading,5)
                                
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            Divider()
                                .padding(.top,20)
                            
                            
                            
                            
                            ForEach(0...15, id:\.self){index in
                                
                                PostView()
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                           
                            
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                }
                .clipped()
                
                
            }
            
         
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showBottomSheet){
            
            
            VStack(alignment: .leading){
                
                
                HStack{
                    
                    Spacer()
                    
                    Button(action:{
                        self.showBottomSheet = false
                    }){
                        Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                    }
                }
                .padding(.top,20)
                
                
                
                if(self.isPoolView){
                    Text("creating pool")
                }
                else{
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.kliquesShareGroupIcon)!)
                        
                        Text("Share")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.kliquesMembersGroupIcon)!)
                        
                        Text("Members")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.kliquesDeleteGroupIcon)!)
                        
                        Text("Delete Group")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.kliquesReportGroupIcon)!)
                        
                        Text("Report Group")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.kliquesUnfollowGroupIcon)!)
                        
                        Text("Unfollow")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.kliquesManageNotificationsGroupIcon)!)
                        
                        Text("Manage Notifications")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.top,10)
                    
                }
                
                
                
                
                
                Spacer()
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        
    }
}


private struct PostView : View{
    
    
    var body: some View{
        
        
        VStack(alignment: .leading){
            
            NavigationLink(destination: KliquesPostViewScreen() ){
                
                Image(AppImages.fitnessEventImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (UIScreen.screenWidth-40) , height: 150)
                    .cornerRadius(12)
                
            }
            
            
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


