//
//  BlogDetailsSreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import SwiftUI
import Lottie

struct BlogDetailsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    @State var showComments : Bool = false
    
    @Binding var isFlowRootActive : Bool
        
    @State var pushDeatilView : Bool = false
    
    @State private var dragOffset : CGFloat = 0.0
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                
                if(value.translation.height > 0){
                    
                    
                    if(value.translation.height >= self.dragOffset && self.showComments){
                        self.dragOffset = value.translation.height
                    }
                    
                    if(value.translation.height >= (UIScreen.screenHeight/4) && (self.showComments)){
                        
                        
//                        print("drag height value = \(value.translation.height)")
                        
                        withAnimation{
                            self.showComments = false
                            self.dragOffset = 0
                        }
                        
                    }
                   
                }
                
            }
            .onEnded { value in
                
                if(value.translation.height < (UIScreen.screenHeight/4)){
                    
                    withAnimation{
                        self.dragOffset = 0
                    }
                    
                }
                
            }
    }
    
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    var body: some View {
        
        ZStack{
            
            NavigationLink(destination: BlogDetailReadScreen(isFlowRootActive: self.$isFlowRootActive) , isActive: self.$pushDeatilView){
                EmptyView()
            }
            
            VStack{
                
                Image(AppImages.profileImageMen)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*50)

                Spacer()
            }
            
            
            
            VStack{
                
                
                HStack{
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(uiImage: UIImage(named: AppImages.backIcon)!)
                    }
                    
                    Spacer()
                    
                    Button(action: {

                    }){
                        Image(uiImage: UIImage(named: AppImages.bookmarkUnseletedProfile)!)
                    }
                    
                    Button(action: {

                    }){
                        Image(uiImage: UIImage(named: AppImages.optionIcon)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                
                
                Spacer()
                
                // like comment share buttons
                
                HStack{
                    
                    Group{
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: AppImages.eyeIcon)!)
                        Text("1M")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                    }
                    
                    
                    Group{
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: AppImages.likeIcon)!)
                        Text("36k")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                    }
                    
                    
                    Group{
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: AppImages.dislikeIcon)!)
                        Text("105")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                    }
                    
                    
                    
                    Group{
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.showComments.toggle()
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.commentIcon)!)
                            Text("15k")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                    
                    
                    Group{
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: AppImages.shareIcon)!)
                        
                        Spacer()
                        
                    }
                    
                    
                }
                .padding(.bottom,10)
                .offset(y: self.dragOffset)
                
                
                
                if(self.showComments){
                    
                    
                    VStack{
                        
                        HStack{
                            
                        }
                        .frame(width: 100, height: 8)
                        .background(Color.black)
                        .cornerRadius(10)
                        
                        Text("Comments")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                            .padding(.top,20)
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            ForEach(0...10 , id:\.self){index in
                                
                                
                                    CommentView()
                                
                                
                            }
                            
                            
                            
                            
                        }
                        .padding(.top,10)
                        
                        
                    }
                    .padding(20)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*70)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                    .offset(y: self.dragOffset)
                    .gesture(self.drag)
                    
                }
                else{
                    
                    VStack{
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            HStack{
                                
                                
                                Text("Expedition to China")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .padding(.trailing,10)
                                
                               Spacer()
                                
                                Image(uiImage :UIImage(named: AppImages.heartIconDark)!)
                                
                                
                            }
                            .padding(.top,10)
                            
                            HStack{
                                
                                Text("Author: Jack Ma")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                            
                            HStack{
                                Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                                Text("20 Min Ago")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                Spacer()
                            }
                            
                            
                            HStack{
                                Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                Text("Beijing, China")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                Spacer()
                            }
                            
                           
                            
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum...")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,20)
                                .overlay(
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Spacer()
                                            Text("Read more").font(AppFonts.ceraPro_16).foregroundColor(AppColors.primaryColor).onTapGesture{self.pushDeatilView=true}
                                        }
                                    }
                                )
                                
                            
                        }
                        .overlay(DisolvingEffect())
                        
                        
                    }
                    .padding(20)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*55)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                    
                    
                }
                
                
                
            }
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        
        
    }
}


private struct CommentView : View{
    
    
    
    
    var body: some View{
        
        
        HStack(alignment: .top){
            
            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                
                
                HStack{
                    
                    Text("Malik Haris Waseem")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat cursus lacus neque neque.")
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(AppColors.textColorLight)
                    
                HStack{
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.likeIconDark)!)
                    
                    Text("35k")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(.black)
                    
                }
                
                Divider()
                    .padding(10)
                
                
            }
            .padding(.leading,5)
            
            
        }
        
        
        
    }
    
}
