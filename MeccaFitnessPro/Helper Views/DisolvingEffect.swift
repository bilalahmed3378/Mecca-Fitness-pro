//
//  DisolvingEffect.swift
//  MeccaFitness
//
//  Created by CodeCue on 23/02/2022.
//

import SwiftUI

struct DisolvingEffect: View {
    var body: some View {
        VStack{
            LinearGradient(colors: [.white,.white.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                .frame(height: 10)
            Spacer()
            LinearGradient(colors: [.white,.white.opacity(0.3)], startPoint: .bottom, endPoint: .top)
                .frame(height: 10)
        }
    }
}

