//
//  AddEventScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/04/2022.
//

import SwiftUI

struct AddEventScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getEventCategoriesApi = GetEventCategoriesApi()
    
    
    @State var coverImage : Image? = nil
    @State var showImagePicker: Bool = false
    
    @State var title : String = ""
    @State var description : String = ""
    @State var fee : String = ""
    @State var limit : String = ""
    @State var videoUrl : String = ""
    @State var webUrl : String = ""
    @State var mediaUrl : String = ""
    @State var meetingUrl : String = ""
    @State var selectedEventType : String = ""
    @State var question : String = ""
    @State var answer : String = ""
    
    
    @State var saveEvent : Bool = false
    @State var shareEvent : Bool = false
    
    @State var selectedCategory : EventCategoryModel? = nil
    @State var selectedSubCategory : EventCategoryChildModel? = nil
    
    @State var showEventCategories : Bool = false
    @State var showEventSubCategories : Bool = false
    @State var showEventTypes : Bool = false

    
    @State var paidEvent : Bool = false
    @State var eventStartTime : Date = Date()
    @State var eventEndTime : Date = Date()
    @State var eventDate : Date = Date()
    @State var ticketStartDate : Date = Date()
    @State var ticketEndDate : Date = Date()

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    
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
                
                
                if (self.getEventCategoriesApi.isLoading){
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        
                        VStack(spacing:5){
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: 100, height: 100)
                                .padding(.top,20)
                            
                            
                            Group{
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 100)
                                
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                            }
                            
                            
                            Group{
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(height: 40)
                                    
                                    Spacer()
                                        .frame(width: 50)
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(height: 40)
                                }
                                
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(height: 40)
                                    
                                    Spacer()
                                        .frame(width: 50)
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(height: 40)
                                }
                                
                                
                                HStack{
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                            }
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                    }
                    .clipped()
                    
                }
                else if(self.getEventCategoriesApi.isApiCallDone && self.getEventCategoriesApi.isApiCallSuccessful){
                    
                    if(self.getEventCategoriesApi.dataRetrivedSuccessfully){
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            
                            VStack(spacing:5){
                                
                                Button(action: {
                                    self.showImagePicker = true
                                }){
                                    
                                    VStack{
                                        
                                        if(self.coverImage != nil){
                                            coverImage!
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(10)
                                        }
                                        else{
                                            
                                            Image(systemName : "photo.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .padding(20)
                                                .frame(width: 100, height: 100)
                                                .foregroundColor(AppColors.grey500)
                                                .cornerRadius(10)
                                            
                                        }
                                        
                                        
                                        Text("Cover Images")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                    }
                                    
                                    
                                }
                                .padding(.top,20)
                                
                                
                                
                                
                                
                                
                                
                                // input fields
                                Group{
                                    
                                    Group{

                                        HStack{
                                            Text("Title")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)

                                        TextField("Title", text: self.$title)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        
                                        
                                        HStack{
                                            Text("Category")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        
                                        VStack( alignment : .leading , spacing:0){
                                            
                                            HStack(alignment:.center){
                                                
                                                Text(self.selectedCategory == nil ? "Select" : self.selectedCategory!.name)
                                                    .font(AppFonts.ceraPro_14)
                                                    .lineLimit(1)
                                                    .foregroundColor(AppColors.textColor)
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    withAnimation{
                                                        self.showEventCategories.toggle()
                                                    }
                                                }){
                                                    Image(systemName: self.showEventCategories ? "chevron.up" : "chevron.down")
                                                        .resizable()
                                                        .aspectRatio( contentMode: .fit)
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(AppColors.textColor)
                                                        .padding(.leading,5)
                                                }
                                        
                                            }
                                            .padding()
                                            
                                            if(self.showEventCategories){
                                                
                                                Divider()
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                ScrollView(.vertical , showsIndicators  :false){
                                                    
                                                    LazyVStack(alignment: .leading){
                                                        
                                                        ForEach(self.getEventCategoriesApi.apiResponse!.data , id:\.self){category in
                                                            
                                                            Button(action: {
                                                                withAnimation{
                                                                    self.selectedCategory = category
                                                                    self.showEventCategories.toggle()
                                                                }
                                                            }){
                                                                Text("\(category.name)")
                                                                    .font(AppFonts.ceraPro_14)
                                                                    .foregroundColor(AppColors.textColor)
                                                                    .padding(10)
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                }
                                                .clipped()
                                                .frame( height: 200)
                                                
                                            }
                                        }
                                        .background(AppColors.textFieldBackgroundColor)
                                        .cornerRadius(10)
                                        
                                        
                                        if(self.selectedCategory != nil){
                                            if !(self.selectedCategory!.child_categories.isEmpty){
                                                
                                                Group{
                                                    
                                                    HStack{
                                                        Text("Sub-Category")
                                                            .font(AppFonts.ceraPro_12)
                                                            .foregroundColor(AppColors.textColor)
                                                        Spacer()
                                                    }
                                                    .padding(.top,10)
                                                    .onAppear{
                                                        self.selectedSubCategory = nil
                                                    }
                                                    
                                                   
                                                    VStack( alignment : .leading , spacing:0){
                                                        
                                                        HStack(alignment:.center){
                                                            
                                                            Text(self.selectedSubCategory == nil ? "Select" : self.selectedSubCategory!.name)
                                                                .font(AppFonts.ceraPro_14)
                                                                .lineLimit(1)
                                                                .foregroundColor(AppColors.textColor)
                                                            
                                                            Spacer()
                                                            
                                                            Button(action: {
                                                                withAnimation{
                                                                    self.showEventSubCategories.toggle()
                                                                }
                                                            }){
                                                                Image(systemName: self.showEventSubCategories ? "chevron.up" : "chevron.down")
                                                                    .resizable()
                                                                    .aspectRatio( contentMode: .fit)
                                                                    .frame(width: 15, height: 15)
                                                                    .foregroundColor(AppColors.textColor)
                                                                    .padding(.leading,5)
                                                            }
                                                    
                                                        }
                                                        .padding()
                                                        
                                                        if(self.showEventSubCategories){
                                                            
                                                            Divider()
                                                                .padding(.leading,20)
                                                                .padding(.trailing,20)
                                                            
                                                            ScrollView(.vertical , showsIndicators  :false){
                                                                
                                                                LazyVStack(alignment: .leading){
                                                                    
                                                                    ForEach(self.selectedCategory!.child_categories , id:\.self){subCategory in
                                                                        
                                                                        Button(action: {
                                                                            withAnimation{
                                                                                self.selectedSubCategory = subCategory
                                                                                self.showEventSubCategories.toggle()
                                                                            }
                                                                        }){
                                                                            Text("\(subCategory.name)")
                                                                                .font(AppFonts.ceraPro_14)
                                                                                .foregroundColor(AppColors.textColor)
                                                                                .padding(10)
                                                                        }
                                                                        
                                                                    }
                                                                    
                                                                }
                                                                
                                                            }
                                                            .clipped()
                                                            .frame( height: 200)
                                                            
                                                        }
                                                    }
                                                    .background(AppColors.textFieldBackgroundColor)
                                                    .cornerRadius(10)
                                                    
                                                }
                                                
                                            }
                                        }
                                        
                                        
                                        HStack{
                                            Text("Description")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)

                                        
                                        TextEditor(text: self.$description)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .colorMultiply(AppColors.textFieldBackgroundColor)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                            .cornerRadius(10)
                                            .frame( height: 100)
                                        
                                        
                                        Toggle("Paid Event", isOn: self.$paidEvent)
                                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                            .padding(.top,10)
                                        
                                        if(self.paidEvent){
                                            
                                            HStack{
                                                Text("Registeration Fee")
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(AppColors.textColor)
                                                Spacer()
                                            }
                                            .padding(.top,10)
                                            
                                            TextField("$", text: self.$fee)
                                                .autocapitalization(.none)
                                                .font(AppFonts.ceraPro_14)
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                                .cornerRadius(10)
                                                .onChange(of: self.fee) { newValue in
                                                    let filtered = newValue.filter { ".0123456789".contains($0) }
                                                    if fee != filtered {
                                                    self.fee = filtered
                                                    }
                                                }
                                            
                                        }
                                                                                
                                    }
                                    
                                    
                                    
                                    Group{
                                        
                                        DatePicker("Event Shedule Date", selection: $eventDate , displayedComponents: .date)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .accentColor(AppColors.primaryColor)
                                            .padding(.top,15)
                                        
                                        
                                        HStack{
                                            
                                            VStack(alignment:.leading){
                                                
                                                Text("Starting Time")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                                DatePicker("", selection: $eventStartTime , displayedComponents: .hourAndMinute)
                                                    .accentColor(AppColors.primaryColor)
                                                    .labelsHidden()
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment:.leading){
                                                
                                                Text("Ending Time")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                                DatePicker("", selection: $eventEndTime , displayedComponents: .hourAndMinute)
                                                    .accentColor(AppColors.primaryColor)
                                                    .labelsHidden()
                                                
                                            }
                                            
                                        }
                                        .padding(.top,15)
                                        
                                        
                                        HStack{
                                            Text("Ticket Availabilty Date")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,15)

                                        
                                        
                                        HStack{
                                            
                                            VStack(alignment:.leading){
                                                
                                                Text("From")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                                DatePicker("", selection: $ticketStartDate , displayedComponents: .date)
                                                    .accentColor(AppColors.primaryColor)
                                                    .labelsHidden()
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment:.leading){
                                                
                                                Text("To")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                                DatePicker("", selection: $ticketEndDate , displayedComponents: .date)
                                                    .accentColor(AppColors.primaryColor)
                                                    .labelsHidden()
                                                
                                            }
                                            
                                        }
                                        .padding(.top,5)
                                        
                                        
                                        HStack{
                                            Text("Event Type")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        
                                        VStack( alignment : .leading , spacing:0){
                                            
                                            HStack(alignment:.center){
                                                
                                                Text(self.selectedEventType.isEmpty ? "Select" : self.selectedEventType)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                
                                                Spacer()
                                                
                                                
                                                Button(action: {
                                                    withAnimation{
                                                        self.showEventTypes.toggle()
                                                    }
                                                }){
                                                    Image(systemName: self.showEventTypes ? "chevron.up" : "chevron.down")
                                                        .resizable()
                                                        .aspectRatio( contentMode: .fit)
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(AppColors.textColor)
                                                        .padding(.leading,5)
                                                }
                                                
                                                
                                                
                                                
                                            }
                                            .padding()
                                            
                                            
                                            if(self.showEventTypes){
                                                
                                                Divider()
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                Button(action: {
                                                    withAnimation{
                                                        self.selectedEventType = "Physical"
                                                        self.showEventTypes.toggle()
                                                    }
                                                }){
                                                    Text("Physical")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColor)
                                                        .padding()
                                                }
                                                
                                                Button(action: {
                                                    withAnimation{
                                                        self.selectedEventType = "Online"
                                                        self.showEventTypes.toggle()
                                                    }
                                                }){
                                                    Text("Online")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColor)
                                                        .padding()
                                                }
                                                
                                            }
                                        }
                                        .background(AppColors.textFieldBackgroundColor)
                                        .cornerRadius(10)
                                        
                                        
                                        
                                        HStack{
                                            Text("Attendes Limit")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextField("Attendes Limit", text: $limit)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(AppColors.textFieldBackgroundColor)
                                            .cornerRadius(10)
                                            .onChange(of: self.limit) { newValue in
                                                let filtered = newValue.filter { "0123456789".contains($0) }
                                                if limit != filtered {
                                                self.limit = filtered
                                                }
                                            }
                                        
                                        
                                        
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
                                    
                                    
                                    // url input group
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
                                        
                                        
                                        
                                        HStack{
                                            Text("Meeting URL")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextField("https://", text: $meetingUrl)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(AppColors.textFieldBackgroundColor)
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
                                    
                                    
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            
                        }
                        .clipped()
                        
                        
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to load create event page. Try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Button(action: {
                            
                            self.getEventCategoriesApi.getEventCategories()
                            
                        }){
                            
                            GradientButton(lable: "Try Again")
                                .frame(width: 150)
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                    }
                    
                }
                else if(self.getEventCategoriesApi.isApiCallDone && (!self.getEventCategoriesApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Button(action: {
                        
                        self.getEventCategoriesApi.getEventCategories()
                        
                    }){
                        
                        GradientButton(lable: "Try Again")
                            .frame(width: 150)
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                }
                else{
                    Spacer()
                    
                    Text("Unable to load create event page. Try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Button(action: {
                        
                        self.getEventCategoriesApi.getEventCategories()
                        
                    }){
                        
                        GradientButton(lable: "Try Again")
                            .frame(width: 150)
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                }
                
                
                
                
                
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
            
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getEventCategoriesApi.getEventCategories()
        }
        .sheet(isPresented: self.$showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                
                let size = Image(uiImage: image).asUIImage().getSizeIn(.megabyte)
                
                print("image data size ===> \(size)")
                
                
                if(size > 1){
                    self.toastMessage = "Image must be less then 1 mb"
                    self.showToast = true
                }
                else{
                    self.coverImage = Image(uiImage: image)
                }
            }
        }
        
    }
    
}
