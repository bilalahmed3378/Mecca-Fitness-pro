//
//  SwiftUIView.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 02/01/2023.
//

import SwiftUI

struct OnboardingGuideScreen: View {
    @State private var selection = 0
    @Environment(\.presentationMode) var presentationMode

    

    var body: some View {
        
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
                
                Text("Onboarding")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(.black)
                
                
                Spacer()
                
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            
            TabView(selection : $selection ){
                
                partOne(selection: self.$selection)
                    .tag(0)
                
                partTwo(selection: self.$selection)
                    .tag(1)
                
                partThree(selection: self.$selection)
                    .tag(2)
                
                partFour()
                    .tag(3)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .foregroundColor(.red)
            
        }
        .navigationBarHidden(true)
    }
}


struct partOne: View {
    
    @Binding var selection : Int
    
    init(selection : Binding<Int>){
        self._selection = selection
       
    }
    
    var body: some View{
        
        VStack{
            Spacer()
            Image(AppImages.OnboardingScreenOne)
            
            VStack(alignment: .leading){
                
                Text("Onboarding")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.red)
                    .padding(.bottom,20)
                    .padding(.top,20)
                
                Text("You have to provide your debit card details and details for relevant linked account to go through the onboarding process. Once approved and verified onboarding will be complete. ")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .padding(.bottom,10)
            }
            
            Spacer()
            
            Button(action: {
                self.selection = 1
            }, label: {
                Text("Next")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.primaryColor))
                    .padding()
            })
           
            
            Spacer()
            
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        
    }
}

struct partTwo: View {
    
    @Binding var selection : Int
    
    init(selection : Binding<Int>){
        self._selection = selection
       
    }
    var body: some View{
        
        VStack{
            Spacer()
            Image(AppImages.OnboardingScreenTwo)
            
            VStack(alignment: .leading){
                Text("Account verification")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.red)
                    .padding(.bottom,10)
                    .padding(.top,20)

                
                Text("Verify your account through stripe and sit back to get paid directly in your bank account within minutes. Normally it takes 2 working days to verify your account.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .padding(.bottom,10)

                
            }

            Spacer()
            
            Button(action: {
                self.selection = 2
            }, label: {
                Text("Next")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.primaryColor))
                    .padding()
            })
           
            
            Spacer()
            
            
           
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        
    }
}

struct partThree: View {
    @Binding var selection : Int
    
    init(selection : Binding<Int>){
        self._selection = selection
       
    }
    var body: some View{
        
        VStack{
            
            Spacer()
            Image(AppImages.OnboardingScreenThree)
            
            VStack(alignment: .leading){
                Text("Activate Account")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.red)
                    .padding(.bottom,10)
                    .padding(.top,20)

                
                Text("Activate one of verified accounts to receive payments, refunds etc.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .padding(.bottom,10)

                
            }

            
            Spacer()
            
            Button(action: {
                self.selection = 3
            }, label: {
                Text("Next")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.primaryColor))
                    .padding()
            })
          
            
            Spacer()
           
            
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        
    }
}

struct partFour: View {
   
    var body: some View{
        
        VStack{
            Spacer()
            Image(AppImages.OnboardingScreenFour)

            VStack(alignment: .leading){
                Text("Receive withdrawals")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.red)
                    .padding(.bottom,10)
                    .padding(.top,20)

                
                Text("All the payments will be credited to your active verified account including upcoming transactions, refunds, after the threshold security period.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .padding(.bottom,10)
            }

            Spacer()

           
            
            
            NavigationLink(destination: CardDetailsScreen(), label: {
                Text("Click here to enter card details")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.primaryColor))
                    .padding()
            })
           
            Spacer()

            
            
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        
    }
}

