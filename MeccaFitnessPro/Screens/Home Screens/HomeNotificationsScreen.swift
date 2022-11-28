//
//  NotificationsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/03/2022.
//

import SwiftUI

struct HomeNotificationsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
//
//    @Binding var isFlowRootActive : Bool
//
//
//    init(isFlowRootActive : Binding<Bool>){
//        self._isFlowRootActive = isFlowRootActive
//    }
    
    
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
                    
                   
                    
                    Text("Notifications")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
        
                
                ScrollView(.vertical,showsIndicators: false){
                    
              
                    
                    ForEach(0...15 , id:\.self){index in
                        
                        NotificationsView()
                        
                    }
                    
                    
                }
                .padding(.top,20)
                .clipped()
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}


private struct NotificationsView : View{
    
    
    var body: some View{
        
        
        VStack{
         
            
            HStack{
                
                Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(3)
                    .background(Circle().fill(.white))
                
                Text("Lorem Ipsum is simply dummy text")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .padding(.top,5)
                
                Spacer()
                
            }
            
            Divider()
                .padding(10)
           
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
       
        
        
    }
    
    
    
}
