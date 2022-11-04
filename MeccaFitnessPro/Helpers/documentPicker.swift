//
//  documentPicker.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 26/09/2022.
//

import Foundation
import SwiftUI
import UIKit
import UniformTypeIdentifiers
import MobileCoreServices


struct DocumentPicker: UIViewControllerRepresentable {
    
    
    @ObservedObject var uploadChatMediaApi : uploadImgApi
        
    let myDocumentDataReceiver: MyDocumentDataReceiver

    
    func makeCoordinator() -> DocumentPicker.Coordinator {
        return DocumentPicker.Coordinator(parent1: self)
    }
    
    let types : [UTType] = [UTType.text, UTType.pdf , UTType.plainText, UTType.utf8PlainText , UTType.zip ]
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
//        let picker = UIDocumentPickerViewController(documentTypes: types, in: .open)
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: types, asCopy: false)

        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: DocumentPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<DocumentPicker>) {
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        
        var parent: DocumentPicker
        
        init(parent1: DocumentPicker){
            parent = parent1
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            
            
            do{
                          
                var apiDataArray : [uploadImgBodyDataModel] = []

                for fileUrl in urls{
                    let fileData = try Data(contentsOf: fileUrl)
                    print(fileUrl.pathExtension)
                    apiDataArray.append(uploadImgBodyDataModel(file_string: "data:document/\(fileUrl.pathExtension)_document;base64,\(fileData.base64EncodedString())" ))
                }

                let data = try JSONEncoder().encode(uploadImgBodyModel(data: apiDataArray))

                parent.myDocumentDataReceiver.documentDataReceived(documentData: data)
                
            
            }
            
            catch{
                
                print("error")
                
                
            }
                

        }
        
    }
}




