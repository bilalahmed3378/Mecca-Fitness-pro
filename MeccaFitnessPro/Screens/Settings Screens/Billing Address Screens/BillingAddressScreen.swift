//
//  BillingAddressScreen.swift
//  MeccaFitness
//  Created by CodeCue on 12/03/2022.
////

import SwiftUI

struct BillingAddressScreen: View {

    @Environment(\.presentationMode) var presentationMode
    @Environment(\.locale) var locale



    @StateObject var viewAllBillingAddressesApi  = ViewAllBillingAddressesApi()
    @StateObject var deleteBillingAddressApi  = DeleteBillingAddressApi()


    @State var countryId: String = ""

//    @State var selectedCountry : Country = Country(countryCode: "US")


    @State var selected : Int = 0
    @State var selectedPayment : Int = 0


    @State var showToast : Bool = false
    @State var toastMessage : String = ""

    @State var selectedAddress : ViewAllBillingAddressesDataModel? = nil

    @State var addAddressRouteActive : Bool = false
    @State var updateAddressRouteActive : Bool = false

    @Binding var isFlowRootActive : Bool


    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }


    var body: some View {


        ZStack{

            if(self.selectedAddress != nil){

                NavigationLink(destination: EditBillingAddressScreen(isFlowRootActive: self.$updateAddressRouteActive, viewAllBillingAddressesDataModel: self.selectedAddress!), isActive : self.$updateAddressRouteActive){

                    EmptyView()

                }

            }


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



                    Text("Billing Addresses")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)


                    Spacer()



                    NavigationLink(destination: AddBillingAddress(isFlowRootActive: self.$addAddressRouteActive), isActive: self.$addAddressRouteActive){

                        Image(systemName: "plus.app")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(.black)
                            .padding(3)
                    }

                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )


//                CountryPicker(selectedCountry: self.$selectedCountry)


                if (self.viewAllBillingAddressesApi.isLoading){

                    ScrollView(.vertical , showsIndicators: false){

                        ForEach(0...7 , id:\.self){ index in

                            VStack(alignment : .leading ,spacing:10){

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame( width: (UIScreen.widthBlockSize*20) ,height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame( width: (UIScreen.widthBlockSize*45) ,height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 15)

                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)




                        }

                    }

                }
                else if(self.viewAllBillingAddressesApi.isApiCallDone && self.viewAllBillingAddressesApi.isApiCallSuccessful){

                    if (self.viewAllBillingAddressesApi.dataRetrivedSuccessfully && (!(self.viewAllBillingAddressesApi.apiResponse?.data.isEmpty ?? false))){


                        ScrollView(.vertical , showsIndicators: false){

                            LazyVStack{

                                ForEach(self.viewAllBillingAddressesApi.apiResponse!.data , id:\.self){ address in

                                    Button(action: {
                                        self.selectedAddress = address
                                        self.updateAddressRouteActive = true
                                    }){

                                    VStack(alignment: .leading , spacing: 4){

                                        HStack{

                                            Text("\(address.first_name) \(address.last_name)")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                                .lineLimit(1)

                                            Spacer()
                                        }

                                        HStack(spacing: 0){

                                            Text("\(address.city),")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)

                                            Text(" \(address.state),")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)

                                            Text(" \(address.country).")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)

                                        }

                                        Text("\(address.address)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(2)

                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius: 3 ))
                                    .overlay(
                                        HStack{
                                            Spacer()
                                            VStack{

                                                if(self.deleteBillingAddressApi.isLoading && self.deleteBillingAddressApi.address_id == address.id){

                                                    ProgressView()
                                                        .frame(width: 15, height: 15)
                                                        .onDisappear{
                                                            if(self.deleteBillingAddressApi.isApiCallDone && self.deleteBillingAddressApi.isApiCallSuccessful){
                                                                if(self.deleteBillingAddressApi.deletedSuccessfully){
                                                                    self.toastMessage = "Address deleted successfully"
                                                                    self.showToast = true
                                                                    self.deleteBillingAddressApi.address_id = 0
                                                                    self.deleteBillingAddressApi.isApiCallDone = false
                                                                    self.deleteBillingAddressApi.isApiCallSuccessful = false
                                                                    self.deleteBillingAddressApi.deletedSuccessfully = false

                                                                    withAnimation{
                                                                        self.viewAllBillingAddressesApi.apiResponse!.data.removeAll(where: {$0.id == address.id})
                                                                    }

                                                                }
                                                                else{
                                                                    self.toastMessage = "Unable to delete address."
                                                                    self.showToast = true
                                                                }
                                                            }
                                                            else if(self.deleteBillingAddressApi.isApiCallDone && (!self.deleteBillingAddressApi.isApiCallSuccessful)){
                                                                self.toastMessage = "Unable to access internet, Please check your internet connectionand try again."
                                                                self.showToast = true
                                                            }
                                                        }
                                                }
                                                else{

                                                    Button(action: {

                                                        if !(self.deleteBillingAddressApi.isLoading){
                                                            withAnimation{
                                                                self.deleteBillingAddressApi.deleteBillingAddress(billing_address_id: address.id)
                                                            }
                                                        }


                                                    }){
                                                        Image(systemName: "minus")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .foregroundColor(.white)
                                                            .padding(5)
                                                            .frame(width: 15, height: 15)
                                                            .background(Circle()
                                                                            .fill(AppColors.primaryColor))
                                                            .offset( y: -5)

                                                    }

                                                }


                                                Spacer()
                                            }
                                        }
                                    )
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,15)

                                    }

                                }

                            }

                        }
                        .clipped()


                    }
                    else{

                        Spacer()


                        Text("No billing address found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)

                        Button(action: {
                            withAnimation{
                                self.viewAllBillingAddressesApi.viewAllBillingAddresses()
                            }
                        }){
                            Text("Refresh")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                        }
                        .padding(.top,30)


                        Spacer()

                    }

                }
                else if(self.viewAllBillingAddressesApi.isApiCallDone && (!self.viewAllBillingAddressesApi.isApiCallSuccessful)){

                    Spacer()


                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)

                    Button(action: {
                        withAnimation{
                            self.viewAllBillingAddressesApi.viewAllBillingAddresses()
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
                else{

                    Spacer()


                    Text("Unable to get billing addresses.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)

                    Button(action: {
                        withAnimation{
                            self.viewAllBillingAddressesApi.viewAllBillingAddresses()
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


            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }





        }
        .navigationBarHidden(true)
        .onAppear{
            self.viewAllBillingAddressesApi.viewAllBillingAddresses()

        }



    }
}



