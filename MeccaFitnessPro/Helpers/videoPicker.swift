//
//  videoPicker.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 30/09/2022.
//

import Foundation
import SwiftUI
import PhotosUI
import UIKit
import UniformTypeIdentifiers


struct videoPicker: UIViewControllerRepresentable {
    //    var configuration: PHPickerConfiguration
    @Binding var isPresented: Bool
    
    let myVideoDataReceiver: MyVideoDataReceiver
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared() )
        configuration.filter = .videos
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: PHPickerViewControllerDelegate {
        
       var parent: videoPicker
        
        init(_ parent: videoPicker) {
            self.parent = parent
        }
        
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            print(results)
            
            
            // Set isPresented to false because picking has finished.
            parent.isPresented = false
            
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
                
                
                provider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { url, err in
                    if let videoUrl = url {
                        
                        
                        DispatchQueue.main.sync {
                            
                            do{
                                
                                var apiDataArray : [uploadImgBodyDataModel] = []
                                
                                let videoData = try Data(contentsOf: videoUrl)
                                
                                apiDataArray.append(uploadImgBodyDataModel(file_string: "data:video/mp4;base64,\(videoData.base64EncodedString())" ))
                                
                                let dataToApi = try JSONEncoder().encode(uploadImgBodyModel(data: apiDataArray))

                                self.parent.myVideoDataReceiver.videoDataReceived(videoData: dataToApi)

                            }
                            
                            catch{
                                
                                print("video picker error")
                                self.parent.myVideoDataReceiver.videoDataReceived(videoData: nil)
                                
                            }
                              
                        }
                        
                        
                    }
                    else{
                        self.parent.myVideoDataReceiver.videoDataReceived(videoData: nil)
                    }
                }
            }
            else{
                self.parent.myVideoDataReceiver.videoDataReceived(videoData: nil)
            }
        }
        
    }
    
}
