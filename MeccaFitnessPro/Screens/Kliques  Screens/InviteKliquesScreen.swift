//
//  InviteKliquesScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/03/2022.
//

import SwiftUI

struct InviteKliquesScreen: View {
    
    
    
    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    
    
    var body: some View {
        
        
        
        ZStack{
            
            VStack(spacing: 0){
                
                
                
                HStack{
                    
                    Text("Suggested People")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    LazyVStack(spacing: 0){
                        
                        
                        ForEach(0...20 , id:\.self){index in
                            
                            
                            InvitePeopleView()
                            
                        }
                        
                    }
                    
                }
                .padding(.top,10)
                
                
                
                Button(action: {
                    self.isFlowRootActive = false
                }){
                    
                    GradientButton(lable: "Done!")
                    
                }
                .padding(20)
                
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
}




private struct InvitePeopleView  : View {
    
    @State var invited : Bool = false
    
    var body: some View{
        
        HStack(spacing: 0){
            
            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(3)
                .background(Circle().fill(.white))
            
            
            VStack(alignment: .leading,spacing: 0){
                
                HStack{
                    
                    Text("Martin Randolph")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
                
                HStack{
                    
                    Text("UI UX designer")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                        .padding(.bottom,3)
                        .padding(.top,3)
                    
                    Spacer()
                    
                    if(self.invited){
                        
                        Text("Invite")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .padding(.top,5)
                            .padding(.bottom,5)
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            .background(LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .leading, endPoint: .trailing).cornerRadius(14))
                        
                        
                    }
                    
                }
                
                
                
                HStack{
                    
                    Text("Turkey")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                        .padding(.leading,4)
                    
        
                }
                
                
            }
            .padding(.leading,5)
        
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        .padding(.top,10)
        .padding(.bottom,10)
        .background(AppColors.grey200)
        .onTapGesture{
            withAnimation{
                self.invited.toggle()
            }
        }
        
        
    }
    
}
