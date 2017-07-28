//
//  PostService.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/26/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth




struct PostService {
    static func create(for image: UIImage) {
        //  let imageRef = Storage.storage().reference().child("test_image.jpg")
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            print("ERROR", downloadURL?.absoluteString)
            
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            let aspectHeight = image.aspectHeight
            create(forURLstring: urlString, aspectHeight: aspectHeight)
            //   print("image url: \(urlString)")
        }
    }
    private static func create(forURLstring urlString: String, aspectHeight: CGFloat) {
        //create a new post in a data base
        // create new post in database
        // 1
//     let currentUser = User.current
        // 2
        let post = Post(imageURL: urlString, imageHeight: aspectHeight)
        // 3
        let dict = post.dictValue
        
        // 4
        let postRef = Database.database().reference().child("posts").child(Auth.auth().currentUser!.uid).childByAutoId()
        postRef.updateChildValues(dict)

    }

}

