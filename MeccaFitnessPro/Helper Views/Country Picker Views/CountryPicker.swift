//
//  CountryPickerController.swift
//  MeccaFitness
//
//  Created by CodeCue on 07/07/2022.
//


import SwiftUI


struct CountryPicker : View{
    
    
    @Binding var selectedCountry : Country
    @Binding var isShowing : Bool

    
    @State var countries : [Country] = []
    
    @State var filteredList : [Country] = []
    
    @State var searchText: String = ""
    
    
    init(selectedCountry : Binding<Country> , isShowing : Binding<Bool>) {
        self._selectedCountry = selectedCountry
        self._isShowing = isShowing
    }
    
    var body: some View{
        
        
        
        VStack{
            
            
            TextField("Search" , text : self.$searchText)
                .onChange(of: self.searchText) { value in
                    self.filteredList = self.filterCountries()
                }
            
            
            ScrollView(.vertical,showsIndicators: false){
                
                LazyVStack{
                    
                    
                    if(self.searchText.isEmpty){
                        
                        ForEach(self.countries , id:\.self){ country in
                            
                            Button(action: {
                                
                                withAnimation{
                                    self.selectedCountry = country
                                    self.isShowing = false
                                }
                                
                            }){
                             
                                HStack{
                                    
                                    Image("\(country.countryCode)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                    
                                    Text("(\(country.countryCode))")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                    Text(country.countryName)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    Text(country.dialingCode ?? "")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                }
                                
                            }
                            .padding(10)
                            
                            Divider()
                            
                        }
                        
                    }
                    else{
                        
                        ForEach(self.filterCountries() , id:\.self){ country in
                            
                            Button(action: {
                                
                                withAnimation{
                                    self.selectedCountry = country
                                    self.isShowing = false
                                }
                                
                            }){
                             
                                HStack{
                                    
                                    Image("\(country.countryCode)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                    
                                    Text("(\(country.countryCode))")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                    Text(country.countryName)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    Text(country.dialingCode ?? "")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,5)
                                    
                                }
                                
                            }
                            .padding(10)
                            
                            Divider()
                            
                        }
                        
                    }
                    
                    
                }
                
            }
            
        }
        .frame(width: (UIScreen.widthBlockSize * 80), height: (UIScreen.heightBlockSize * 60))
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200).shadow(radius: 5))
        .onAppear{
            do{
                if let fileURL = Bundle.main.url(forResource: "countries", withExtension: "plist") {
                    self.countries  = try fetchCountries(fromURLPath: fileURL)
                }
                else{
                    print("no file found")
                }
            }
            catch{
                
            }
        }
    }
    
    
    func fetchCountries(fromURLPath path: URL) throws -> [Country] {
        
        guard let rawData = try? Data(contentsOf: path),
              let countryCodes = try? PropertyListSerialization.propertyList(from: rawData, format: nil) as? [String] else {
            return []
        }
        
        // Sort country list by `countryName`
        let sortedCountries = countryCodes.map { Country(countryCode: $0) }.sorted { $0.countryName < $1.countryName }
        
        print("Succefully prepared list of \(sortedCountries.count) countries")
        
        return sortedCountries
    }
    
    
    func filterCountries() -> [Country] {
        
        if(self.searchText.isEmpty){
            return self.countries
        }
        
        var dataToReturn : [Country] = []
        
        for country in countries {
            if(country.countryName.lowercased().starts(with: searchText.lowercased())){
                dataToReturn.append(country)
            }
        }
        
        return dataToReturn
        
    }
    
    
    
}


extension Array where Element: Equatable {
    func removeDuplicates() -> [Element] {
        var uniqueValues = [Element]()
        forEach {
            if !uniqueValues.contains($0) {
                uniqueValues.append($0)
            }
        }
        return uniqueValues
    }
}



