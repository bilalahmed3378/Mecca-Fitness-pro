//
//  ProductViewScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 01/03/2022.
//

import SwiftUI

struct MyProductViewScreen: View {
    
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var images : Array<String> = [AppImages.profileImageMen , AppImages.profileImageGirl , AppImages.homeListItemImage , AppImages.profileImageGirl]
    
    @State private var selection = 0
    
    @State private var dragOffset : CGFloat = 0.0
    
    @State var pushDeatilView : Bool = false
    
    @Binding var isFlowRootActive : Bool
    
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                
                
                
                if(value.translation.height < 0){
                    
                    self.dragOffset = value.translation.height
                    
                    if(value.translation.height < -(UIScreen.screenHeight/10)){
                        
                        
                        print("drag height value = \(value.translation.height)")
                        
                        self.dragOffset = 0
                        
                        self.pushDeatilView = true
                        
                        
                    }
                   
                    
                }
                
                
            }
            .onEnded { value in
                
                if(value.translation.height > -(UIScreen.screenHeight/10)){
                    
                    self.dragOffset = 0
                    
                }
                
            }
    }
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    var body: some View {
        
        
        ZStack{
            
//            NavigationLink(destination: ProductViewScreen(isFlowRootActive: self.$isFlowRootActive) , isActive: self.$pushDeatilView){
//                EmptyView()
//            }
            
            VStack{
                
                TabView(selection : $selection){
                                
                    ForEach(0...(images.count-1) , id:\.self){ i in
                        
                        Image("\(images[i])")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*65)
                        
                    }

                                
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*65)
                .clipped()
                
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
                    
                   
                    
                    
                    NavigationLink(destination: EditMyProductScreen(isFlowRootActive: self.$isFlowRootActive)){
                        
                        Image(uiImage: UIImage(named: AppImages.editProfileIcon)!)
                        
                    }
                    
                    
                    
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
                    
                    HStack{
                        
                    }
                    .frame(width: 60, height: 8)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.top,20)
                    .gesture(self.drag)
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        
                        HStack{
                            
                            Text("Dress Shirts")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.textColorLight)
                            
                            Spacer()
                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(AppColors.primaryColor)
                            
                            Text("(5.0)")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.primaryColor)
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        HStack{
                            
                            Text("Plain Casual Shirt")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            
                            
                            Text("$300")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        HStack{
                            
                            Text("S")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(1)
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(AppColors.grey300))
                            
                            
                            Text("M")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(1)
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(AppColors.grey300))
                            
                            
                            Text("L")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(1)
                                .frame(width: 30, height: 30)
                                .background(Circle().fill(AppColors.grey300))
                            
                            
                            Spacer()
                            
                            
                            
                            Circle()
                                .fill(AppColors.mainYellowColor)
                                .frame(width: 30, height: 30)
                            
                          
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        
                        
                        HStack{
                            
                            Text("Description")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        HStack{
                            
                            Text("The Gigalodon Hotel is a hotel that has dinner facilities beside a pool... \(Text("Read More").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,5)
                        
                    }
                    
                    
                    HStack{
                        
                        HStack{
                            Spacer()
                            Text("Add Offer")
                                .foregroundColor(.white)
                                .font(AppFonts.ceraPro_14)
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                        .shadow(radius: 10)
                        .padding(.trailing,15)
                        
                        
                        Spacer()
                        
                        
//                        NavigationLink(destination: MyProductDetailViewScreen(isFlowRootActive: self.$isFlowRootActive)){
//
//                            GradientButton(lable: "View")
//                                .padding(.leading,15)
//
//                        }
                        
                        
                    }
                    .padding(.bottom,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*40)
                .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                .offset(y: self.dragOffset)
            }
            
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)

    }
    
}

