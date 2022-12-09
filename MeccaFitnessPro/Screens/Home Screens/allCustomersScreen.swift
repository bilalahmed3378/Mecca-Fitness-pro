//
//  allCustomersScreen.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 01/09/2022.
//

import SwiftUI
import Kingfisher

struct allCustomersScreen: View, MyLocationReceiver {
    

        @Environment(\.presentationMode) var presentationMode

        @StateObject var GetAllCustomersApi = getAllCustomersApi()


//screen vars
        @Binding var isFlowRootActive : Bool
        @State var isSearching = false
        @State var isLoadingFirstTime = true
        @State var showFilters = false
        

        //filter vars
    let dateFormatter  = DateFormatter()
    @State var showPlacePicker = false
    @State var showGenderPicker = false
    @State var customerList: [getAllCustomersCustomerModel] = []
    @State var searchText = ""
    @State var email = ""
    @State var customerEmail = ""
    @State var phone = ""
    @State var customerPhone = ""
    @State var customerTitle = ""
    @State var customerOrganization = ""
    @State var customerGender = ""
    @State var customerAgeFrom = ""
    @State var customerAgeTo = ""
    @State var customerJoinDateFrom: Date = Date()
    @State var customerJoinDateTo: Date = Date()
    @State var selectedCustomerJoinDateFrom = ""
    @State var selectedCustomerJoinDateTo = ""
    @State var search_radius = ""
    @State var searchRadius = ""
    @State var selectedLat = ""
    @State var selectedLong = ""
    @State var customerAddress = ""



        


        init(isFlowRootActive : Binding<Bool>){
            self._isFlowRootActive = isFlowRootActive
            self.dateFormatter.dateFormat = "YYYY-MM-dd"

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


                        if(self.isSearching){


                            HStack{

                                Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                                TextField("Search Customer" , text: self.$searchText)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.grey500)
                                    .onChange(of: self.searchText) { newValue in
                                        self.searchText = newValue.limit(limit : 20)
                                        GetAllCustomersApiCall()
                                    }

                                Button(action: {
                                    withAnimation{
                                        self.isSearching = false
                                        self.searchText = ""
                                        self.searchText = ""
                                        self.email = ""
                                        self.customerEmail = ""
                                        self.phone = ""
                                        self.customerPhone = ""
                                        self.customerTitle = ""
                                        self.customerOrganization = ""
                                        self.customerGender = ""
                                        self.customerAgeFrom = ""
                                        self.customerAgeTo = ""
                                        self.selectedCustomerJoinDateFrom = ""
                                        self.selectedCustomerJoinDateTo = ""
                                        self.search_radius = ""
                                        self.searchRadius = ""
                                        self.selectedLat = ""
                                        self.selectedLong = ""
                                        self.customerAddress = ""

                                        
                                        
                                        GetAllCustomersApiCall()
                                    }
                                }){
                                    Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)

                                }

                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                            .padding(.leading,10)
                            .padding(.trailing,10)

                        }
                        else{

                            Spacer()

                            Text("Customers")
                                .font(AppFonts.ceraPro_18)
                                .foregroundColor(.black)
                                .padding(.leading,25)

                            Spacer()


                        }


                        if !(self.isSearching){
                            Button(action: {
                                withAnimation{
                                    self.isSearching = true
                                }
                            }){
                                Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(.trailing,5)
                            }
                        }

                        // filter button

                        Button(action: {
                            self.showFilters = true
                        }, label: {


                            if ( !(self.customerEmail.isEmpty) || !(self.customerPhone.isEmpty) || !(self.customerTitle.isEmpty) ||
                                 !(self.customerOrganization.isEmpty) || !(self.customerGender.isEmpty) || !(self.selectedCustomerJoinDateFrom.isEmpty) && !(self.selectedCustomerJoinDateTo.isEmpty) || !(self.searchRadius.isEmpty) || !(self.searchRadius.isEmpty) || !(self.selectedLat.isEmpty) && !(self.selectedLong.isEmpty) ){

                                Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
                            }
                            else{
                                Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                            }

                        })


                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)


                    if (self.GetAllCustomersApi.isLoading){



                        ScrollView(.vertical,showsIndicators: false){

                            VStack{
                                ForEach(0...10 , id:\.self){ item in

                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: UIScreen.screenWidth-40, height: 150)



                                }
                            }.padding(.leading,20)
                                .padding(.trailing,20)
                        }



                    }

                    else if(self.GetAllCustomersApi.isApiCallDone && (!self.GetAllCustomersApi.isApiCallSuccessful)){

                        VStack{


                            Spacer()

                            Text("Unable to access internet.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)

                            Button(action: {
                                withAnimation{
                                    GetAllCustomersApiCall()
                                                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                            }
                            .padding(.top,30)

                            Spacer()

                        }
                    }

                    else if(self.GetAllCustomersApi.isApiCallDone && self.GetAllCustomersApi.isApiCallSuccessful && (!self.GetAllCustomersApi.dataRetrivedSuccessfully) ){

                        VStack{

    //
                            Spacer()

                            Text("Unable to get customers.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)

                            Button(action: {
                                withAnimation{
                                    GetAllCustomersApiCall()
                                                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                            }
                            .padding(.top,30)

                            Spacer()

                        }

                    }



                    else if(self.GetAllCustomersApi.isApiCallDone && GetAllCustomersApi.isApiCallSuccessful && GetAllCustomersApi.dataRetrivedSuccessfully){

                        if !(self.customerList.isEmpty){

                            ScrollView(.vertical,showsIndicators: false){

                                LazyVStack{

                                    ForEach(self.customerList.indices, id:\.self){ index in

                                        allCustomersCustomerCard(customer: self.customerList[index])

                                            .onAppear{

                                                if(index == (self.customerList.count - 1)){

                                                    if !(self.GetAllCustomersApi.isLoadingMore){

    //                                                    if(self.lo)

                                                        if(self.GetAllCustomersApi.apiResponse != nil){

                                                            if(self.GetAllCustomersApi.apiResponse!.data != nil){

                                                                if !(self.GetAllCustomersApi.apiResponse!.data!.next_page_url.isEmpty){

                                                                    self.GetAllCustomersApi.getAllCustomers(customerList: self.$customerList, url: self.GetAllCustomersApi.apiResponse!.data!.next_page_url)

                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }

                                        if(self.GetAllCustomersApi.isLoadingMore && (index == (self.customerList.count - 1))){
                                            ProgressView()
                                                .padding(20)
                                        }
                                    }



                                }

                            }


                        }

                        else{
                            Spacer()

                            Text("No customers found.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)

                            Button(action: {
                                withAnimation{

                                    GetAllCustomersApiCall()

                                }

                            }){
                                Text("Rrefresh")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                            }
                            .padding(.top,30)

                            Spacer()
                        }


                    }

                }




            }
            .navigationBarHidden(true)
            .onAppear{

                if(self.isLoadingFirstTime){

                    if(self.customerList.isEmpty){

                        GetAllCustomersApiCall()
                    }

                    self.isLoadingFirstTime = false


                }

            }

            .sheet(isPresented: self.$showFilters){

                ZStack{

                VStack(spacing:0){

                    HStack{
                        Text("Filter Your Search ")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)

                        Spacer()

                        Button(action:{
                            self.showFilters = false
                        }){
                            Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                        }
                    }.padding(.top,20)


                    ScrollView(.vertical , showsIndicators: false){

                        
                        //email
                        Group{
                            
                            
                            Divider()
                                .padding(.top,5)
                            
                        VStack{

                            HStack{

                        Text("Email")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)

                            Spacer()

                            if !(self.customerEmail.isEmpty){
                                Button(action: {
                                    withAnimation{
                                        self.customerEmail = ""

                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }

                            }

                            TextField("email", text: self.$customerEmail)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.customerEmail) { newValue in
                                    self.customerEmail = newValue.limit(limit : 40)
                                }


                        }


                        Divider()
                            .padding(.top,5)

                        }
                        
                        
                        
                        //phone
                        Group{
                            
                        VStack{

                            HStack{

                        Text("Phone")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)

                            Spacer()

                            if !(self.customerPhone.isEmpty){
                                Button(action: {
                                    withAnimation{
                                        self.customerPhone = ""

                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }

                            }

                            TextField("phone", text: self.$customerPhone)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.customerPhone) { newValue in
                                    self.customerPhone = newValue.limit(limit : 15)
                                }


                        }


                        Divider()
                            .padding(.top,5)

                        }
                        
                        
                        
                        //title
                        Group{
                            
                        VStack{

                            HStack{

                        Text("Title")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)

                            Spacer()

                            if !(self.customerTitle.isEmpty){
                                Button(action: {
                                    withAnimation{
                                        self.customerTitle = ""

                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }

                            }

                            TextField("title", text: self.$customerTitle)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.customerTitle) { newValue in
                                    self.customerTitle = newValue.limit(limit : 30)
                                }


                        }


                        Divider()
                            .padding(.top,5)

                        }
                           
                        
                        //organization
                        Group{
                            
                        VStack{

                            HStack{

                        Text("Organization")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)

                            Spacer()

                            if !(self.customerOrganization.isEmpty){
                                Button(action: {
                                    withAnimation{
                                        self.customerOrganization = ""

                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }

                            }

                            TextField("organization", text: self.$customerOrganization)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.customerOrganization) { newValue in
                                    self.customerOrganization = newValue.limit(limit : 30)
                                }


                        }


                        Divider()
                            .padding(.top,5)

                        }
                        
                        
                        
                        // gender selection group
                        Group{
                            
                            HStack{

                        Text("Gender")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)

                            Spacer()

                            if !(self.customerGender.isEmpty){
                                Button(action: {
                                    withAnimation{
                                        self.customerGender = ""

                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }

                            }
                            
                            VStack( alignment : .leading , spacing:0){
                                
                                HStack(alignment:.center){
                                    
                                    Text(self.customerGender.isEmpty ? "Select" : self.customerGender)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Spacer()
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.showGenderPicker.toggle()
                                        }
                                    }){
                                        Image(systemName: self.showGenderPicker ? "chevron.up" : "chevron.down")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(AppColors.textColor)
                                            .padding(.leading,5)
                                    }

                                    
                                        
                                    
                                }
                                .padding()
                                
                                
                                if(self.showGenderPicker){
                                    
                                    Divider()
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.customerGender = "male"
                                            self.showGenderPicker.toggle()
                                        }
                                    }){
                                        Text("Male")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .padding()
                                    }
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.customerGender = "female"
                                            self.showGenderPicker.toggle()
                                        }
                                    }){
                                        Text("Female")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .padding()
                                    }
                                    
                                }
                            }
                            .background(AppColors.textFieldBackgroundColor)
                            .cornerRadius(10)
                            
                            Divider()
                                .padding(.top,5)
                            
                        }


                        // joining date
                        Group{

                            HStack{

                            Text("Joining Date")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)

                                Spacer()


                                if ( !(self.selectedCustomerJoinDateFrom.isEmpty) && !(self.selectedCustomerJoinDateTo.isEmpty)  ){
                                    Button(action: {
                                        withAnimation{
                                            self.selectedCustomerJoinDateFrom = ""
                                            self.selectedCustomerJoinDateTo = ""

                                        }
                                    }){
                                        Text("clear")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.primaryColor)
                                            .padding(5)
                                            .padding(.leading,10)
                                            .padding(.trailing,10)
                                            .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                    }
                                }


                            }

        //                    from date
                                     HStack{

                                         DatePicker("From", selection: self.$customerJoinDateFrom , displayedComponents: .date)
                                             .font(AppFonts.ceraPro_14)
                                             .foregroundColor(AppColors.grey500)
                                             .onChange(of: self.customerJoinDateFrom, perform: {newValue in
                                                 self.selectedCustomerJoinDateFrom = self.dateFormatter.string(from: newValue)

                                             })
                                             .padding(.top,10)



                                     }


                        //to date
                        HStack{

                            DatePicker("To", selection: self.$customerJoinDateTo , displayedComponents: .date)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: self.customerJoinDateTo, perform: {newValue in
                                    self.selectedCustomerJoinDateTo = self.dateFormatter.string(from: newValue)

                                })
                                .padding(.top,10)



                        }
                            
                            Divider()
                                .padding(.top,5)


                    }

            

                        //search radius
                        Group{
                            
                        VStack{

                            HStack{

                        Text("Search Radius")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)

                            Spacer()

                            if !(self.searchRadius.isEmpty){
                                Button(action: {
                                    withAnimation{
                                        self.searchRadius = ""

                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }

                            }

                            TextField("radius", text: self.$searchRadius)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.searchRadius) { newValue in
                                    self.searchRadius = newValue.limit(limit : 10)
                                }


                        }


                        Divider()
                            .padding(.top,5)

                        }
                        
                        
                        
                        
                        //lattitude longitude
                        Group{
                            
                        VStack{

                            HStack{

                        Text("Address")
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)


                            Spacer()

                                if ( !(self.selectedLat.isEmpty) && !(self.selectedLong.isEmpty)  ){
                                    Button(action: {
                                        withAnimation{
                                            self.selectedLat = ""
                                            self.selectedLong = ""
                                            self.customerAddress = ""

                                        }
                                    }){
                                        Text("clear")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.primaryColor)
                                            .padding(5)
                                            .padding(.leading,10)
                                            .padding(.trailing,10)
                                            .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                    }
                                }

                            }

                            HStack{

                                Text(self.customerAddress.isEmpty ? "Select Address" : self.customerAddress)
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


                            Divider()
                                .padding(.top,5)

                        }
                            
                            

                        
                    }
                        
                        

                    GradientButton(lable: "Apply Filter")
                        .padding(.bottom,20)
                        .padding(.top,20)
                        .onTapGesture{

                            GetAllCustomersApiCall()

                            self.showFilters = false
                        }




                }.padding(.leading,20)
                    .padding(.trailing,20)

                    if(self.showPlacePicker){
                        ZStack {

                            Rectangle().fill(Color.black.opacity(0.3))

                            VStack{

                                HStack{



                                    Text(self.customerAddress)
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
                            print("Selected Place Address ===> \(self.customerAddress)\nSelected Place Latitude ===> \(self.selectedLat)\nSelected Palce Longitude ===> \(self.selectedLong)")
                        }
                    }


        }


                
                
                
            }
            
        }
    
    
    func locationReceived(placeViewModel: PlaceViewModel) {
        self.selectedLat = String(placeViewModel.latitude)
        self.selectedLong = String(placeViewModel.longitude)
        self.customerAddress  = placeViewModel.address

        self.showPlacePicker.toggle()
    }

    
    
}

        





private struct allCustomersCustomerCard : View {
    
    
    let customer : getAllCustomersCustomerModel
    
    @State var userDetailViewActive = false
    
    var body: some View{
        
        
        NavigationLink(destination: UserProfileScreen(user_id: customer.id)){
        
        HStack(alignment : .top){
            
            KFImage(URL(string: self.customer.profile!.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            
            VStack(alignment:.leading){
                
                // user name
                HStack{
                    
                    Text("\(self.customer.first_name) \(self.customer.last_name)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .padding(.trailing,5)
                    
                    Spacer()
                    
                }
                
                
                Spacer()
                
              
                
              
                    
                Text(self.customer.profile!.title)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                
                Spacer()
               
                    
                    
                Text(self.customer.profile!.address)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                
                
                
            }
            .padding(.leading,5)
            
        }
        .padding(12)
        .frame(width: (UIScreen.screenWidth - 40) , height: 100)
        .background(RoundedRectangle(cornerRadius : 10).fill(AppColors.grey100).shadow(radius: 3))
        .padding(.top,10)
        
            
        }
        
    }
    
}





        extension allCustomersScreen{

      

            func GetAllCustomersApiCall(){

                self.GetAllCustomersApi.getAllCustomers(customerList: self.$customerList, search_query: self.searchText , email: self.customerEmail, phone: self.customerPhone, title: self.customerTitle, organization: self.customerOrganization, gender: self.customerGender, ageFrom: self.customerAgeFrom, ageTo: self.customerAgeTo, joinDateFrom: self.selectedCustomerJoinDateFrom, joinDateTo: selectedCustomerJoinDateTo, search_radius: self.searchRadius, current_latitude: self.selectedLat, current_longitude: self.selectedLong)

            }

        }

