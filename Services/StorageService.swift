//
//  StorageService.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/26/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage




struct StorageService {
    // provide method for uploading images
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        
        // convert the image to a data by reducing the quality of the image ,if not the the image will take long time to upload
        guard let imageData = UIImageJPEGRepresentation(image, 0.1) else {
            return completion(nil)
        }
        //upload media to the path provided as a parameter to the method
        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
            
            //check for an error and return nil to our completion clousure to signal there was an error
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            // return to the download URL for the image
            completion(metadata?.downloadURL())
        })
    }
    

}
