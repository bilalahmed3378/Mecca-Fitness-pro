//
//  RatingStars.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 04/08/2022.
//

import SwiftUI

struct RatingView: View {
    
    private let MAX_RATING: Double = 5.0 // Defines upper limit of the rating
  private let COLOR = AppColors.mainYellowColor // The color of the stars

  let rating: Double
  private let fullCount: Int
  private let emptyCount: Int
  private let halfFullCount: Int

  init(rating: Double) {
    self.rating = rating
    fullCount = Int(rating)
    emptyCount = Int(self.MAX_RATING - rating)
    halfFullCount = (Double(fullCount + emptyCount) < self.MAX_RATING) ? 1 : 0
  }

  var body: some View {
    HStack {
        ForEach(0..<fullCount , id:\.self) { _ in
         self.fullStar
       }
        ForEach(0..<halfFullCount, id:\.self) { _ in
         self.halfFullStar
       }
        ForEach(0..<emptyCount ,id:\.self) { _ in
         self.emptyStar
       }
     }
  }

  private var fullStar: some View {
      Image(systemName: "star.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 24, height: 24)
          .foregroundColor(self.COLOR)
          
  }

  private var halfFullStar: some View {
    Image(systemName: "star.lefthalf.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 24, height: 24)
          .foregroundColor(self.COLOR)
  }

  private var emptyStar: some View {
    Image(systemName: "star")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 24, height: 24)
          .foregroundColor(self.COLOR)
  }
}
