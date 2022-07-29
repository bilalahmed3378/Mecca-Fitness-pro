//
//  QuestionDetailViewScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/07/2022.
//

import SwiftUI

struct QuestionDetailViewScreen: View {
    
    
    @Binding var isFlowRootActive : Bool
    let question_id : Int
    
    init(isFlowRootActive : Binding<Bool> , question_id : Int){
        self._isFlowRootActive = isFlowRootActive
//        self.dateFormatter.dateFormat = "YYYY-MM-dd"
        self.question_id = question_id
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


