//
//  LottieView.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let name : String
    let loopMode : LottieLoopMode 
    
    init(name : String , loopMode : LottieLoopMode = .loop){
        self.name = name
        self.loopMode = loopMode
    }

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
