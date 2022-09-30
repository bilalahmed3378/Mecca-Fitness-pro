//
//  CreateTicketScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 27/09/2022.
//

import SwiftUI
import Charts

struct CreateTicketScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var subject = ""
    @State private var description = ""
    
    @ObservedObject var addSupportTicketApi  = AddSupportTicketApi()
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var filesData : Image? = nil
    
    @State var showBottomSheet: Bool = false
    
    @State var toTicket: Bool = false
    
    @State var toAllSupportTickets : Bool = false
    
    var body: some View {
        
        ZStack{
//            NavigationLink(destination: ViewAllSupportTicketsScreen(isFlowRootActive: self.$toAllSupportTickets), isActive: self.$toTicket){
//                EmptyView()
//            }
            
        VStack{
            
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
                
                Text("Create Ticket")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(.black)
                
                Spacer()
                
              
                
            }.padding(.bottom)
           
            
            
            HStack{
                Text("Subject")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                Spacer()
            }
            .padding(.top,10)
            
            TextField("Subject", text: $subject)
                .autocapitalization(.none)
                .font(AppFonts.ceraPro_14)
                .padding()
                .background(AppColors.textFieldBackgroundColor)
                .cornerRadius(10)
               
            
            HStack{
                Text("Description")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                Spacer()
            }
            .padding(.top,10)
            
            TextEditor(text: $description)
                .autocapitalization(.none)
                .font(AppFonts.ceraPro_14)
                .colorMultiply(AppColors.textFieldBackgroundColor)
                .padding()
                .background(AppColors.textFieldBackgroundColor)
                .cornerRadius(10)
                .frame( height: 120)
                .overlay(
                    VStack(alignment: .leading){
                    
                    HStack{
                        
                        if(self.description.isEmpty){
                            Text("Description")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,5)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                }.padding()
                )
            
            if(self.filesData != nil){
                
                Spacer()
                    .frame( height: 30)
                
                
                Button(action: {
                    self.showBottomSheet = true
                }){
                    
                    self.filesData!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (UIScreen.screenWidth - 30), height: 200)
                        .cornerRadius(8)
                        .padding(.bottom,10)
                    
                }
                
               
                    
                
            }
            
            else{
                Button(action: {
                    withAnimation{
                        self.showBottomSheet = true
                    }
                }, label: {
                    HStack{
                        VStack{
                            Text("Attach a file")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,150)
                                .padding(.trailing,150)
                                .padding(.top,70)
                                .padding(.bottom,70)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [10])))
                                .background(AppColors.textFieldBackgroundColor)
                               .padding(.top,30)
                            
                        }
                    }
                })
           
                
            }
            
            
            Spacer()
            
            if(self.addSupportTicketApi.isLoading){
                
                ProgressView()
                    .padding()
                    .padding(.top,10)
                    .padding(.bottom , 20)
                
            }
            else{
                
                Button(action: {
                    
                    self.toTicket = false
                    
                    if(self.subject.isEmpty){
                        self.toastMessage = "Please enter subject."
                        self.showToast = true
                    }
                    else if(self.description.isEmpty){
                        self.toastMessage = "Please enter desription."
                        self.showToast = true
                    }
                    else if(self.filesData == nil){
                        self.toastMessage = "Please add file"
                        self.showToast = true
                    }
                  
                    else{


//                        self.addSupportTicketApi.isLoading = true


                       


                        if(false){
                            self.toastMessage = "Image must be less then 1 mb"
                            self.showToast = true
                            self.addSupportTicketApi.isLoading = false
                        }
                        else{

//                            let imageData  = (((self.filesData!.asUIImage()).jpegData(compressionQuality: 1)) ?? Data())

                            
                            do{
                                
                                let data  = AddSupportTicketRequestModel(subject: self.subject, message: self.description, fileData: [AddSupportTicketRequestFileModel(file:self.filesData!.asUIImage().base64 ?? "")])
                                
                                let dataToApi = try JSONEncoder().encode(data)

                                self.addSupportTicketApi.addSupportTicket(dataToApi: dataToApi)
                                
                            }
                            catch{
                                self.toastMessage = "Unable to add support ticket. Got encoding error."
                                self.showToast = true
                            }
                            
                            
                        }

                    }
                    
                    
                    
                }){
                    
                    GradientButton(lable: "Create")
                    
                }
                .padding(.leading, 20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom , 20)
                .onAppear{
                    
                    if(self.addSupportTicketApi.isApiCallDone && self.addSupportTicketApi.isApiCallSuccessful){
                        
                        if(self.addSupportTicketApi.ticketCreatedSuccessfully){
                            
                            self.toastMessage = "Support ticked added successfully."
                            self.showToast = true
//                            self.toTicket = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                presentationMode.wrappedValue.dismiss()
                            }
                           
                        }
                        else if(self.addSupportTicketApi.apiResponse != nil){
                            self.toastMessage = self.addSupportTicketApi.apiResponse!.message
                            self.showToast = true
                        }
                        else {
                            self.toastMessage = "Unable to add support ticket. Please try again later."
                            self.showToast = true
                        }
                    }
                    else if(self.addSupportTicketApi.isApiCallDone && (!self.addSupportTicketApi.isApiCallSuccessful)){
                        self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                        self.showToast = true
                    }
                    
                    
                }

                
                
                
                
                
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
         
        }
        .padding(.leading,20)
        .padding(.trailing,20)
        .padding(.top,10)
       
        
        
        } .navigationBarHidden(true)
        .sheet(isPresented: self.$showBottomSheet) {
            
            ImagePicker(sourceType: .photoLibrary) { image in

                
                let size = image.getSizeIn(.megabyte)

                print("image data size ===> \(size)")
                
                if(size > 1){
                    self.toastMessage = "Image must be less then 1 mb"
                    self.showToast = true
                    self.addSupportTicketApi.isLoading = false
                }
                
                self.filesData = Image(uiImage: image)

            }

        }
    }
//
   
}

