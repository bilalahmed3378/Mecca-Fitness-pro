//
//  EditEventScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 25/06/2022.
//

import SwiftUI
import Kingfisher

struct UpdateEventScreen: View , MyLocationReceiver  {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getEventCategoriesApi = GetEventCategoriesApi()
    
    @StateObject var addEventApi = AddEventApi()

    @State var firstTimeLoaded : Bool = false

    
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
    @State var address : String = ""
    @State var latitude : Double = 0.0
    @State var longitude : Double = 0.0
    
    @State var saveEvent : Bool = false
    @State var shareEvent : Bool = false
    
    @State var selectedCategory : EventCategoryModel? = nil
    @State var selectedSubCategory : EventCategoryChildModel? = nil
    @State var selectedFaq : [UpdateEventFaqModel] = []
    
    @State var showEventCategories : Bool = false
    @State var showEventSubCategories : Bool = false
    @State var showEventTypes : Bool = false
    @State var showPlacePicker : Bool = false

    let dateFormatter  = DateFormatter()
    
    @State var paidEvent : Bool = false
    @State var eventStartTime : Date = Date()
    @State var eventEndTime : Date = Date()
    @State var eventDate : Date = Date()
    @State var ticketStartDate : Date = Date()
    @State var ticketEndDate : Date = Date()

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var eventAddedSuccessfully : Bool = false

    
    @Binding var isFlowRootActive : Bool
    let eventDetails : GetEventDetailsDataModel
    
    init(isFlowRootActive : Binding<Bool> , eventDetails : GetEventDetailsDataModel){
        self._isFlowRootActive = isFlowRootActive
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
        self.eventDetails = eventDetails

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
                    
                    Text("Edit Event")
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
                                        else if !(self.eventDetails.cover_image.isEmpty){
                                            KFImage(URL(string: self.eventDetails.cover_image))
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
                                        
                                        
                                        HStack{
                                            
                                            Text(self.address.isEmpty ? "Location" : self.address)
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                            
                                            Spacer()
                                            
                                        }
                                        .padding()
                                        .background(AppColors.textFieldBackgroundColor)
                                        .cornerRadius(10)
                                        .onTapGesture{
                                            withAnimation{
                                                self.showPlacePicker = true
                                            }
                                        }
                                        
                                        
                                        
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
                                        
                                        
                                        Divider()
                                            .padding(.top,10)
                                            .padding(.bottom,10)
                                        
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
                                        TextEditor(text: self.$answer)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .frame(height: 100)
                                            .colorMultiply(AppColors.textFieldBackgroundColor)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                            .overlay(
                                                HStack{
                                                    VStack{
                                                        
                                                        if(self.answer.isEmpty){
                                                            Text("Answer description here.")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColorLight)
                                                        }
                                                        
                                                        Spacer()
                                                    }
                                                    Spacer()
                                                }
                                                    .padding()
                                            )
                                        
                                        
                                        
                                        Button(action: {
                                            
                                            if(self.question.isEmpty){
                                                self.toastMessage = "Please enter question."
                                                self.showToast = true
                                            }
                                            else if(self.answer.isEmpty){
                                                self.toastMessage = "Please enter answer."
                                                self.showToast = true
                                            }
                                            else{
                                                
                                                withAnimation{
                                                    self.selectedFaq.append(UpdateEventFaqModel(question: self.question, answer: self.answer))
                                                    self.question = ""
                                                    self.answer = ""
                                                }
                                                
                                            }
                                            
                                        }){
                                            Text("Add FAQ")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .padding()
                                                .frame(width: UIScreen.screenWidth-40)
                                                .background(RoundedRectangle(cornerRadius: 12).stroke(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                                    .foregroundColor(AppColors.textColorLight))
                                        }
                                        
                                        
                                        if !(self.selectedFaq.isEmpty){
                                            
                                            LazyVStack{
                                                
                                                ForEach(0...(self.selectedFaq.count - 1) , id:\.self){index in
                                                                                           
                                                       
                                                    VStack(alignment: .leading){
                                                        
                                                        Text("Question #\(index+1):")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(.black)
                                                        
                                                        Text(self.selectedFaq[index].question)
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(.black)
                                                        
                                                        Divider()
                                                            
                                                        
                                                        Text(self.selectedFaq[index].answer)
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColorLight)
                                                        
                                                    }
                                                    .padding()
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5))
                                                    .overlay(
                                                    
                                                        HStack{
                                                            Spacer()
                                                            VStack{
                                                                
                                                                Button(action: {
                                                                    
                                                                    self.selectedFaq.remove(at: index)
                                                                    
                                                                }){
                                                                    
                                                                    Image(systemName: "minus")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .foregroundColor(.white)
                                                                        .padding(5)
                                                                        .frame(width: 15, height: 15)
                                                                        .background(Circle().fill(AppColors.primaryColor))

                                                                }
                                                                .offset(x: 5, y: -5)
                                                                
                                                                Spacer()
                                                            }
                                                        }
                                                        
                                                    )
                                                    .padding(.top,10)
                                                                                           
                                                }

                                            }
                                            .padding(.top,10)
                                        }
                                        
                                       
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                
                                if(self.addEventApi.isLoading){
                                    
                                    HStack{
                                        Spacer()
                                        ProgressView()
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    .padding(.bottom,10)
                                    
                                }
                                else{
                                    
                                    Button(action: {
                                        
                                        if(self.coverImage == nil){
                                            self.toastMessage = "Please select cover image."
                                            self.showToast = true
                                        }
                                        else if(self.title.isEmpty){
                                            self.toastMessage = "Please enter title."
                                            self.showToast = true
                                        }
                                        else if(self.selectedCategory == nil){
                                            self.toastMessage = "Please select event category."
                                            self.showToast = true
                                        }
                                        else if((!self.selectedCategory!.child_categories.isEmpty) && self.selectedSubCategory == nil){
                                            self.toastMessage = "Please select event sub category."
                                            self.showToast = true
                                        }
                                        else if(self.description.isEmpty){
                                            self.toastMessage = "Please enter decription."
                                            self.showToast = true
                                        }
                                        else if(self.paidEvent && self.fee.isEmpty){
                                            self.toastMessage = "Please enter event price."
                                            self.showToast = true
                                        }
                                        else if(self.selectedEventType.isEmpty){
                                            self.toastMessage = "Please select event type."
                                            self.showToast = true
                                        }
                                        else if(self.limit.isEmpty){
                                            self.toastMessage = "Please select attendes limit."
                                            self.showToast = true
                                        }
                                        else if(self.address.isEmpty){
                                            self.toastMessage = "Please select event location."
                                            self.showToast = true
                                        }
                                        else if(self.selectedFaq.isEmpty){
                                            self.toastMessage = "Please add at least one faq."
                                            self.showToast = true
                                        }
                                        else{
                                            
                                            
                                            do{
                                                
                                                let start_hour : String = String(Calendar.current.component(.hour, from: self.eventStartTime))
                                                
                                                let start_minute : String = String(Calendar.current.component(.minute, from: self.eventStartTime))
                                                
                                                let end_hour : String = String(Calendar.current.component(.hour, from: self.eventEndTime))
                                                
                                                let end_minute : String = String(Calendar.current.component(.minute, from: self.eventEndTime))
                                                
//                                                let requestModel = AddEventRequestModel(title: self.title, category_id: self.selectedCategory!.event_category_id, sub_category_id: self.selectedSubCategory?.event_category_id, description: self.description, IsPaid: self.paidEvent, ticket_available_from: self.dateFormatter.string(from: self.ticketStartDate), ticket_available_to: self.dateFormatter.string(from: self.ticketEndDate), registration_fee: Int(self.fee) ?? 0, attendees_limit: Int(self.fee) ?? 0, location_lat: self.latitude, location_long: self.longitude , location_address: self.address, schedule_at: self.dateFormatter.string(from: self.eventDate), start_at_time: "\(start_hour):\(start_minute)", end_at_time: "\(end_hour):\(end_minute)", type: self.selectedEventType.lowercased(), website_url: self.webUrl, video_url: self.videoUrl, media_url: self.mediaUrl, meeting_url: self.meetingUrl, faq: self.selectedFaq , cover_image : self.coverImage!.asUIImage().base64)
//                                                let dataToApi = try JSONEncoder().encode(requestModel)
//                                                self.addEventApi.addEvent(dataToApi: dataToApi)
                                            }
                                            catch{
                                                
                                                self.toastMessage = "Got encoding error."
                                                self.showToast = true
                                                
                                            }
                                            
                                            
                                            
                                        }
                                        
                                        
                                    }){
                                        
                                        Text("Create Event")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(width: (UIScreen.screenWidth-40))
                                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.primaryColor))
                                            .padding(.top,10)
                                            .padding(.bottom,10)
                                        
                                    }
                                    .onAppear{
                                        
                                        
                                        if(self.addEventApi.isApiCallDone && self.addEventApi.isApiCallSuccessful){
                                            
                                            if(self.addEventApi.addedSuccessfully){
                                                self.eventAddedSuccessfully = true
                                            }
                                            else if(self.addEventApi.apiResponse != nil){
                                                self.toastMessage = self.addEventApi.apiResponse!.message
                                                self.showToast = true
                                            }
                                            else{
                                                self.toastMessage = "Unable to add event. Please try again later."
                                                self.showToast = true
                                            }
                                        }
                                        else if(self.addEventApi.isApiCallDone && (!self.addEventApi.isApiCallSuccessful)){
                                            self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                            self.showToast = true
                                        }
                                        
                                        
                                    }
                                    
                                    
                                }
                                
                                
                                
                                NavigationLink(destination: EventSucessfullyAddedScreen(isFlowRootActive: self.$isFlowRootActive) , isActive : self.$eventAddedSuccessfully){

                                    EmptyView()

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
                
                
            }
            
            if(self.showPlacePicker){
                ZStack {
                    
                    Rectangle().fill(Color.black.opacity(0.3))
                    
                    VStack{
                        
                        HStack{
                            
                            
                            
                            Text(self.address.isEmpty ? "Address" : self.address)
                                .font(AppFonts.ceraPro_18)
                                .foregroundColor(AppColors.textColor)
                                .padding(.trailing,10)
                            
                            Spacer()
                            
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20,alignment:.center)
                                .foregroundColor(AppColors.primaryColor)
                                .onTapGesture(perform: {
                                    withAnimation{
                                        self.showPlacePicker = false
                                    }
                                })
                        }
                        .padding(20)
                        
                        PlacesSearchBar(myLocationReceiver: self)
                            .clipped()
                        
                        Spacer()
                        
                    }
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(Color.white))
                    .padding(.top,200)
                    
                }
                .onDisappear{
                    //                    print("Selected Place Address ===> \(result.address)\nSelected Place Latitude ===> \(result.latitude)\nSelected Palce Longitude ===> \(result.longitude)")
                }
            }

            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            if !(self.firstTimeLoaded){
                
                self.firstTimeLoaded = true
                self.getEventCategoriesApi.getEventCategories()
                
                self.title = self.eventDetails.title
                self.description = self.eventDetails.description
                self.paidEvent = self.eventDetails.IsPaid == 1
                if(self.paidEvent){
                    self.fee = String(self.eventDetails.registration_fee)
                }
                self.selectedEventType = self.eventDetails.type.capitalizingFirstLetter()
                self.limit = String(self.eventDetails.attendees_limit)
                self.latitude = self.eventDetails.location_lat
                self.longitude = self.eventDetails.location_long
                self.address = self.eventDetails.location_address
                self.videoUrl = self.eventDetails.video_url
                self.webUrl = self.eventDetails.website_url
                self.mediaUrl = self.eventDetails.media_url
                self.meetingUrl = self.eventDetails.meeting_url
                for faq in self.eventDetails.faqs{
                    self.selectedFaq.append(UpdateEventFaqModel(question: faq.question, answer: faq.answer))
                }
                

                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd, yyyy"
                self.eventDate = dateFormatter.date(from:self.eventDetails.schedule_at)!
                self.ticketStartDate = dateFormatter.date(from:self.eventDetails.ticket_available_from)!
                self.ticketEndDate = dateFormatter.date(from:self.eventDetails.ticket_available_to)!

                let timeFormat = DateFormatter()
                timeFormat.dateFormat = "HH:mm:ss"
                self.eventStartTime = timeFormat.date(from:self.eventDetails.start_at_time)!
                self.eventEndTime = timeFormat.date(from:self.eventDetails.end_at_time)!
                
            }
            
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
    
    
    func locationReceived(placeViewModel: PlaceViewModel) {
        self.address = placeViewModel.address
        self.latitude = placeViewModel.latitude
        self.longitude = placeViewModel.longitude
        self.showPlacePicker.toggle()
    }
    
}
