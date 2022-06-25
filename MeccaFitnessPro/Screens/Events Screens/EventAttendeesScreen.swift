//
//  EventAttendeesScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 25/06/2022.
//

import SwiftUI
import Kingfisher

struct EventAttendeesScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    let attendees : [GetEventDetailsAttendeModel]
    
    init(attendees : [GetEventDetailsAttendeModel]){
        self.attendees = attendees
    }
    
    var body: some View {
        
        
        VStack{
            
            
            HStack{
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color.black)
                }
                
                Spacer()
                
                Text("Attendees")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(.black)
                
                Spacer()
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top, 10)
            
            
            ScrollView(.vertical, showsIndicators : false){
                
                LazyVStack{
                    
                    ForEach(self.attendees , id:\.self){ user in
                       
                        HStack(alignment: .top){
                            
                            KFImage(URL(string: (user.profile?.image ?? "")))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(3)
                                .background(Color.white.clipShape(Circle()))
                            
                            VStack(alignment:.leading){
                                
                                HStack{
                                    Text("\(user.first_name) \(user.last_name)")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    
                                    Spacer()
                                }
                                
                                
                                HStack{
                                    
                                    Text("Email:")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    
                                    Text(user.email)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                    
                                }
                                .padding(.top,5)
                                
                                
                                HStack{
                                    
                                    Text("Phone:")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    
                                    Text(user.profile?.phone ?? "")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                    
                                }
                                .padding(.top,5)
                                
                                
                                HStack{
                                    
                                    Text("Gender:")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    
                                    Text("\(user.profile?.gender ?? "")")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                    
                                }
                                .padding(.top,5)
                                
                                HStack{
                                    
                                    Text("Age:")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    
                                    Text(String(user.profile?.age ?? 0))
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                    
                                }
                                .padding(.top,5)
                                
                            }
                            .padding(.leading,5)
                            
                            
                        }
                        .frame(width: (UIScreen.screenWidth - 50))
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100).shadow(radius: 5))
                        .padding(.top,10)
                        
                    }
                    
                }
                
            }
            .clipped()
            .overlay(DisolvingEffect())
            
        }
        
    }
}

