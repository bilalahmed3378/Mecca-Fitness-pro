//
//  PlacesManual.swift
//  MeccaFitness
//
//  Created by CodeCue on 16/04/2022.
//

import Foundation
import GooglePlaces

/**
 * Create a new session token. Be sure to use the same token for calling
 * findAutocompletePredictions, as well as the subsequent place details request.
 * This ensures that the user's query and selection are billed as a single session.
 */



//class MyPlaces{
//
//
//    func getPlace(query : String) -> GMSPlace{
//
//        let token = GMSAutocompleteSessionToken.init()
//
//        // Create a type filter.
//        let filter = GMSAutocompleteFilter()
//        filter.type = .establishment
////        filter.locationBias = GMSPlaceRectangularLocationOption( northEastBounds,
////                                           southWestBounds);
//
//        placesClient?.findAutocompletePredictions(fromQuery: "cheesebu",
//
//                                                  filter: filter,
//                                                  sessionToken: token,
//                                                  callback: { (results, error) in
//            if let error = error {
//              print("Autocomplete error: \(error)")
//              return
//            }
//            if let results = results {
//              for result in results {
//                print("Result \(result.attributedFullText) with placeID \(result.placeID)")
//              }
//            }
//        })
//
//
//    }
//
//}

