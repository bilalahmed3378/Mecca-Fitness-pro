//
//  RequestScreens.swift
//  MeccaFitness
//
//  Created by CodeCue on 02/03/2022.
//

import SwiftUI

struct RequestScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isRequestView : Bool = true
    @State var searchText : String = ""
    
    
    
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
                    
                    
                    Text("Requests")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                   Spacer()
                    
                    
                 
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)

                
                HStack{
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                        TextField("Search Requests" , text: self.$searchText)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.grey500)

                        Button(action: {
                            withAnimation{
                                self.searchText = ""
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                        }
                        
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                    .padding(.trailing,10)
                    
                    Image(uiImage: UIImage(named: AppImages.filterYellowIcon)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                HStack(alignment: .top){
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("Requests")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.isRequestView ? AppColors.primaryColor : AppColors.textColor)
                            .onTapGesture{
                                withAnimation{
                                    self.isRequestView = true
                                }
                            }
                        
                        if(self.isRequestView){
                            Circle()
                                .fill(AppColors.primaryColor)
                                .frame(width: 5, height: 5)
                        }
                        
                    }
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("History")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.isRequestView ? AppColors.textColor : AppColors.primaryColor)
                            .onTapGesture{
                                withAnimation{
                                    self.isRequestView = false
                                }
                            }
                        
                        if !(self.isRequestView){
                            Circle()
                                .fill(AppColors.primaryColor)
                                .frame(width: 5, height: 5)
                        }
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                ScrollView(.vertical,showsIndicators: false){
                 
                    ForEach(0...10 , id:\.self){index in
                        
                        RequestItem()
                    }
                    
                    
                }
                .padding(.top,10)
                .clipped()
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct RequestItem : View{
    
    
    @State var isDetailViewActive : Bool = false
    
    var body: some View{
        

            
            HStack(alignment: .top){
                
                Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(16)
                
                VStack(alignment: .trailing){
                    
                    HStack{
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("Amy Jackson")
                                .font(AppFonts.ceraPro_18)
                                .foregroundColor(.black)
                            
                            HStack{
                                
                                Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                
                                    Text("Washington, USA")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .padding(.leading,3)
                            
                                Spacer()
                                
                            }
                            .padding(.top,3)
                            
                        }
                        
                        
                        Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                            .padding(.leading,5)
                        
                        
                    }
                    .padding(.leading,5)
                    
                    
                    NavigationLink(destination: RequestDetailViewScreen(isFlowRootActive: self.$isDetailViewActive), isActive: self.$isDetailViewActive){
                    
                        Text("View Request")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .frame(width: 100)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.orangeColor))
                            .padding(.top,10)
                            .onTapGesture{
                                self.isDetailViewActive = true
                            }
                        
                    }
                    
                }
                
                
            }
            .frame(width: (UIScreen.screenWidth-80))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
            .padding(.top,20)
            
        
       
        
        
    }
    
}
