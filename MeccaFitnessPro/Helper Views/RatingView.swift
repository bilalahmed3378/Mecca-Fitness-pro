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
    private let starSize: Double
    private let spacing: Double

    init(rating: Double , starSize : Double = 24 , spacing : Double = 8) {
        self.rating = rating
        self.fullCount = Int(rating)
        self.emptyCount = Int(self.MAX_RATING - rating)
        self.halfFullCount = (Double(fullCount + emptyCount) < self.MAX_RATING) ? 1 : 0
        self.starSize = starSize
        self.spacing = spacing
  }

  var body: some View {
      HStack(spacing: self.spacing) {
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
          .frame(width: self.starSize, height: self.starSize)
          .foregroundColor(self.COLOR)
          
  }

  private var halfFullStar: some View {
    Image(systemName: "star.lefthalf.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: self.starSize, height: self.starSize)
          .foregroundColor(self.COLOR)
  }

  private var emptyStar: some View {
    Image(systemName: "star")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: self.starSize, height: self.starSize)
          .foregroundColor(self.COLOR)
  }
}
