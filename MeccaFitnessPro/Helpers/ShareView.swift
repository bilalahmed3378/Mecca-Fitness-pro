//
//  ShareView.swift
//  MeccaFitness
//
//  Created by CodeCue on 26/10/2022.
//

import SwiftUI

struct ShareView: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareView>) ->
        UIActivityViewController {
            
//           let activityViewController = UIActivityViewController(activityItems: activityItems,
//                   applicationActivities: applicationActivities)
            
            // present the view controller
//                if (UIDevice.current.userInterfaceIdiom == .phone){
//                  return  self.containerView.addSubview(activityViewController.view)
//                }else{
//                    return activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
//                    self.present(activityViewController, animated: true, completion: nil)
//                }
            
        return UIActivityViewController(activityItems: activityItems,
               applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
               context: UIViewControllerRepresentableContext<ShareView>) {
        // empty
    }
}


enum Coordinator {
  static func topViewController(_ viewController: UIViewController? = nil) -> UIViewController? {
    let vc = viewController ?? UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
    if let navigationController = vc as? UINavigationController {
      return topViewController(navigationController.topViewController)
    } else if let tabBarController = vc as? UITabBarController {
      return tabBarController.presentedViewController != nil ? topViewController(tabBarController.presentedViewController) : topViewController(tabBarController.selectedViewController)
      
    } else if let presentedViewController = vc?.presentedViewController {
      return topViewController(presentedViewController)
    }
    return vc
  }
}

struct ActivityView: View {
    var body: some View {
      Button(action: {
        self.shareApp()
      }) {
        Text("Share")
      }
    }
}

extension ActivityView {
  func shareApp() {
    let textToShare = "something..."
    let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
    
    let viewController = Coordinator.topViewController()
    activityViewController.popoverPresentationController?.sourceView = viewController?.view
    viewController?.present(activityViewController, animated: true, completion: nil)
  }
}
