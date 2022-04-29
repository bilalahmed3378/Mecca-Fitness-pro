//
//  BottomSheet.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/04/2022.
//

import Foundation
import SwiftUI

struct BottomSheetView<Content: View>: View {
    
    @Binding var isOpen: Bool

    let minHeight: CGFloat
    let maxHeight: CGFloat
    let content: Content
    
    @GestureState private var translation: CGFloat = 0


    init(isOpen: Binding<Bool>, maxHeight : CGFloat ,@ViewBuilder content: () -> Content) {
        self.minHeight = 0
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
    
    

    var body: some View {
        if(self.isOpen){
            GeometryReader { geometry in
                
                Rectangle().fill(.black.opacity(0.5))
                
                VStack(spacing: 0) {
                    self.indicator.padding()
                    self.content
                }
                .frame(width: geometry.size.width , alignment: .top)
                .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                .frame(height: geometry.size.height, alignment: .bottom)
                .offset(y: self.isOpen ? max(self.translation, 0) : UIScreen.screenHeight)
                .animation(.interactiveSpring(), value: isOpen)
                .animation(.interactiveSpring(), value: translation)
                
            }
            
        }
        else{
            EmptyView()
        }
    }
    

    private var indicator: some View {
        RoundedRectangle(cornerRadius: 100)
            .fill(Color.gray.opacity(0.7))
            .frame(
                width: 100,
                height: 8
        )
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                    print("on draging ===> \(value.translation.height)")
                }.onEnded { value in
                    let snapDistance = UIScreen.screenHeight/10
                    print("on end ===> \(value.translation.height)")
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < snapDistance
                }
            )
    }
    
}
