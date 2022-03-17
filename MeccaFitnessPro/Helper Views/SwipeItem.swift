//
//  SwipeItem.swift
//  KinderLand
//
//  Created by CodeCue on 09/01/2022.
//

import SwiftUI

struct SwipeItem<Content: View, Right: View>: View {
    var content: () -> Content
    var right: () -> Right
    var action: (() -> Void)
    var itemHeight: CGFloat
    
    @State var hoffset: CGFloat = 0
    @State var anchor: CGFloat = 0
    
    let screenWidth = UIScreen.main.bounds.width
    var anchorWidth: CGFloat { screenWidth / 4}
    var swipeThreshold: CGFloat { screenWidth / 10 }
    
    @State var rightSwapDone = false

    init(@ViewBuilder content: @escaping () -> Content,
         @ViewBuilder right: @escaping () -> Right,
         itemHeight: CGFloat,rightAction action: @escaping () -> Void) {
        self.content = content
        self.right = right
        self.itemHeight = itemHeight
        self.action = action
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation {
                    hoffset =  value.translation.width
                    if(hoffset > 0){
                        hoffset = 0
                    }
                    else if((-hoffset) >= anchorWidth){
                        hoffset = -anchorWidth
                        self.rightSwapDone = true
                    }
                    else{
                        self.rightSwapDone = false
                    }
                }
            }
            .onEnded { value in
                withAnimation {
                    if(self.rightSwapDone){
                        self.action()
                        self.rightSwapDone = false
                    }
                    self.hoffset = 0
                }
            }
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                
                content()
                    .frame(width: geo.size.width)
                    
                        
                
                right()
                    .frame(width:self.anchorWidth,height:itemHeight)
                    .clipped()
            }.background(self.rightSwapDone ? AppColors.primaryColor.opacity(0.3) : .white)
        }
        .offset(x: hoffset)
        .frame(height: itemHeight)
        .gesture(drag)
    }
}
