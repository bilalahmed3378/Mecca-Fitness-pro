//
//  Places Search Bar.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 13/04/2022.
//

import Foundation


import UIKit
import GooglePlaces
import SwiftUI


protocol MyLocationReceiver {
  func locationReceived(placeViewModel : PlaceViewModel) //any type of data as your need
}



struct PlacesSearchBar : UIViewControllerRepresentable {


    let myLocationReceiver : MyLocationReceiver

    
    func makeUIViewController(context: Context) -> PlacesSearchBarViewController {
        return PlacesSearchBarViewController(myLocationReceiver: self.myLocationReceiver)
    }
    
    func updateUIViewController(_ uiViewController: PlacesSearchBarViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = PlacesSearchBarViewController
     
}




class PlacesSearchBarViewController : UIViewController , ObservableObject {

  var resultsViewController: GMSAutocompleteResultsViewController?
  var searchController: UISearchController?

    var result : PlaceViewModel?

    
    let myLocationReceiver : MyLocationReceiver

     init(myLocationReceiver : MyLocationReceiver ) {
         self.myLocationReceiver = myLocationReceiver
         super.init(nibName: nil, bundle: nil)
    }
    
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    

  override func viewDidLoad() {
    super.viewDidLoad()

    resultsViewController = GMSAutocompleteResultsViewController()
      resultsViewController?.tableCellBackgroundColor = UIColor.white
      resultsViewController?.tableCellSeparatorColor = UIColor.black
      resultsViewController?.tintColor = UIColor.white
    resultsViewController?.delegate = self

    searchController = UISearchController(searchResultsController: resultsViewController)
    searchController?.searchResultsUpdater = resultsViewController

      let subView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: 45.0))

    subView.addSubview((searchController?.searchBar)!)
    view.addSubview(subView)
    searchController?.searchBar.sizeToFit()
    searchController?.hidesNavigationBarDuringPresentation = false

      
    // When UISearchController presents the results view, present it in
    // this view controller, not one further up the chain.
    definesPresentationContext = true
  }
    
    
    func captureOutput(){
            //your rest of code comes here ,
        if(self.result != nil){
            self.myLocationReceiver.locationReceived(placeViewModel: self.result!)
        }
        else{
            self.myLocationReceiver.locationReceived(placeViewModel: PlaceViewModel(lat: 0.0, long: 0.0, address: ""))
        }
    }
    
    
}

// Handle the user's selection.
extension PlacesSearchBarViewController: GMSAutocompleteResultsViewControllerDelegate {
    
    
  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didAutocompleteWith place: GMSPlace) {
      
    searchController?.isActive = false
    // Do something with the selected place.
      
      if(self.result == nil){
          self.result = PlaceViewModel(lat: 0.0, long: 0.0, address: "")
      }
      
      self.result?.address = place.formattedAddress ?? ""
      self.result?.latitude = place.coordinate.latitude
      self.result?.longitude = place.coordinate.longitude

      self.captureOutput()
      
      
//      print("Place name: \(String(describing: place.name))")
//      print("Place address: \(String(describing: place.formattedAddress))")
//      print("Place lat : \(String(describing: place.coordinate.latitude))")
//      print("Place lon : \(String(describing: place.coordinate.longitude))")

      
  }

  func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                         didFailAutocompleteWithError error: Error){
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
}
