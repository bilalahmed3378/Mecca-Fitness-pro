//
//  AddEventScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/04/2022.
//

import SwiftUI

struct AddEventScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var photos : Array<Image> = []
    @State var showImagePicker: Bool = false

    @State var title : String = ""
    @State var description : String = ""
    @State var question : String = ""
    @State var answer : String = ""
    @State var organizer : String = ""
    @State var fee : String = ""
    @State var limit : String = ""
    @State var videoUrl : String = ""
    @State var webUrl : String = ""
    @State var mediaUrl : String = ""
    
    @State var saveEvent : Bool = false
    @State var shareEvent : Bool = false

    
    
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
                    
                    Text("Event")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    VStack(spacing:5){
                        
                        HStack{
                            Text("Cover Images")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            Spacer()
                            
                        }
                        .padding(.top,20)
                        
                        
                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
                            
                            if(!self.photos.isEmpty){
                                
                                ForEach(0...(self.photos.count-1) ,id: \.self){ index in
                                    
                                    self.photos[index]
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                        .cornerRadius(8)
                                        .overlay(
                                            HStack{
                                                Spacer()
                                                
                                                VStack{
                                                    
                                                    Image(systemName: "minus")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(.white)
                                                        .padding(5)
                                                        .frame(width: 15, height: 15)
                                                        .background(Circle()
                                                                        .fill(AppColors.primaryColor))
                                                        .offset(x: 5, y: -5)
                                                        .onTapGesture{
                                                            self.photos.remove(at: index)
                                                        }
                                                    
                                                    
                                                    Spacer()
                                                }
                                            }
                                        )
                                    
                                }
                            }
                            
                            
                            Image(systemName: "plus.app")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(20)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                .clipShape(Circle())
                                .onTapGesture{
                                    self.showImagePicker = true
                                }
                            
                            
                            
                        }
                        .padding(.top,10)
                        
                        
                        
                        // input fields
                        Group{
                            
                            
                            Group{
                            
                                
                                Group{
                                    // heading
                                    HStack{
                                        Text("Title")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColor)
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    // name input
                                    TextField("Weight Lifting", text: self.$title)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                }
                                
                                
                                
                                Group{
                                    HStack{
                                        Text("Category")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColor)
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                    HStack(alignment:.center){
                                        
                                        Text("Select")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(AppColors.textColor)
                                            .padding(.leading,5)
                                        
                                    }
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                }
                                
                                
                                Group{
                                    HStack{
                                        Text("Sub-Category")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColor)
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                    HStack(alignment:.center){
                                        
                                        Text("Select")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(AppColors.textColor)
                                            .padding(.leading,5)
                                        
                                    }
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                }
                                
                            }
                            
                            
                            Group{
                                // heading
                                HStack{
                                    Text("Description")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                // name input
                                TextField("Write Description", text: self.$description)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            
                            // name group
                            Group{
                                // heading
                                HStack{
                                    Text("FAQ")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                // name input
                                TextField("Question here", text: self.$question)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                
                                
                                // name input
                                TextField("Answer description here. lreom ipsum is a dummy text.", text: self.$answer)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                
                                
                                
                                Text("Add more FAQ’s")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .padding()
                                    .frame(width: UIScreen.screenWidth-40)
                                    .background(RoundedRectangle(cornerRadius: 12).stroke(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                                    .foregroundColor(AppColors.textColorLight))
                                
                                
                            }
                            
                            
                            
                            Group{
                                HStack{
                                    Text("Orginizer")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Enter", text: $organizer)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    .keyboardType(.decimalPad)
                            }
                            
                            
                            
                            
                            Group{
                                HStack{
                                    Text("Tickets")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack(alignment:.center){
                                    
                                    Text("Free/Ticket")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                    
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                            }
                            
                            
                            
                            
                            Group{
                                HStack{
                                    Text("Registration Fee (Starting From)")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("$ 50", text: $fee)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            Group{
                                HStack{
                                    Text("Limit of Attendes")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("xx", text: $limit)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            Group{
                                HStack{
                                    Text("Location")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack(alignment:.center){
                                    
                                    Text("Shangai, China")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Spacer()
                                    
                                    Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .padding(.leading,5)
                                    
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                            }
                            
                            
                            // overview input group
                            Group{
                                HStack{
                                    Text("Date")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack(alignment:.center){
                                    
                                    Text("August 10, 2021")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                    
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                            }
                            
                            
                        
                            
                           
                        }
                        
                        
                        
                        
                        Group{
                            
                            
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack{
                                        Text("Start Time")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColor)
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                    HStack(alignment:.center){
                                        
                                        Text("10:00 AM")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(AppColors.textColor)
                                            .padding(.leading,5)
                                        
                                    }
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    
                                }
                                
                                
                                VStack{
                                    
                                    HStack{
                                        Text("End Time")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColor)
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                    HStack(alignment:.center){
                                        
                                        Text("04:00 PM")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(AppColors.textColor)
                                            .padding(.leading,5)
                                        
                                    }
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    
                                    
                                }
                                
                            }
                            
                            
                            
                            
                            
                            Group{
                                
                                HStack{
                                    Text("Event Type")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack(alignment:.center){
                                    
                                    Text("Local")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                    
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                                
                            }
                            
                            
                            
                            
                            
                            // check box group
                            Group{
                               
                                
                                HStack{
                                    
                                    Image(systemName: self.saveEvent ? "checkmark.square" : "square")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.black)
                                    
                                    Text("Save Events")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    
                                }
                                .onTapGesture{
                                    
                                    self.saveEvent.toggle()
                                    
                                }
                                
                                
                                HStack{
                                    
                                    Image(systemName: self.shareEvent ? "checkmark.square" : "square")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.black)
                                    
                                    Text("Share Events")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    
                                }
                                .onTapGesture{
                                    
                                    self.shareEvent.toggle()
                                    
                                }
                                    
                                    
                                    
                                    
                                

                            }
                            
                            
                            
                            // video url input group
                            Group{
                                HStack{
                                    Text("Video URL")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("https://", text: $videoUrl)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            Group{
                                HStack{
                                    Text("Website URL")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("https://", text: $webUrl)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            Group{
                                HStack{
                                    Text("Media URL")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("https://", text: $mediaUrl)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                        }
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                   
                }
                .clipped()
                 
                
                
                NavigationLink(destination: EventSucessfullyAddedScreen(isFlowRootActive: self.$isFlowRootActive)){
                    
                    Text("Create Event")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: (UIScreen.screenWidth-40))
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.primaryColor))
                        .padding(.top,10)
                        .padding(.bottom,10)
                    
                }
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                self.photos.append(Image(uiImage: image))
            }
        }
    
    }
        
}
