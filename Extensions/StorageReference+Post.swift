//
//  StorageReference+Post.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/26/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseAuth



extension StorageReference {
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = Auth.auth().currentUser!.uid
        print("USER ID", uid)
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
}
