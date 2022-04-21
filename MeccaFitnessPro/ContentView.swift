//
//  ContentView.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
       
        NavigationView{
            
            SplashScreen()
                .onAppear(perform: {
                    UIScrollView.appearance().bounces = false
                })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}



    extension UIScreen{
        static let screenWidth = UIScreen.main.bounds.size.width
        static let widthBlockSize = (UIScreen.main.bounds.size.width/100)
        static let screenHeight = UIScreen.main.bounds.size.height
        static let heightBlockSize = (UIScreen.main.bounds.size.height/100)
        static let screenSize = UIScreen.main.bounds.size
    }


extension View {
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        // here is the call to the function that converts UIView to UIImage: `.asImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
// This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}


extension UIImage {

    public enum DataUnits: String {
        case byte, kilobyte, megabyte, gigabyte
    }

    func getSizeIn(_ type: DataUnits)-> Double {

        guard let data = self.pngData() else {
            return 100000000
        }

        var size: Double = 0.0

        switch type {
        case .byte:
            size = Double(data.count)
        case .kilobyte:
            size = Double(data.count) / 1024
        case .megabyte:
            size = Double(data.count) / 1024 / 1024
        case .gigabyte:
            size = Double(data.count) / 1024 / 1024 / 1024
        }

        return size
    }
    
    
    
    var highestQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 1.0)! }
    var highQualityJPEGNSData: Data    { return self.jpegData(compressionQuality: 0.75)!}
    var mediumQualityJPEGNSData: Data  { return self.jpegData(compressionQuality: 0.5)! }
    var lowQualityJPEGNSData: Data     { return self.jpegData(compressionQuality: 0.25)!}
    var lowestQualityJPEGNSData: Data  { return self.jpegData(compressionQuality: 0.0)! }
    
    
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

}
