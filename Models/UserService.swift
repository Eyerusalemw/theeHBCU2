//
//  UserService.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/18/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


struct UserService {
    
    static func createUser(fullName:String,email:String,password:String, completion: @escaping () -> ()){
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            // If there is an error
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            // Keys for firebase backen
            let values = ["email":email,"fullname":fullName]
            
            // Make sure a user was made
            guard let uid = user?.uid else { return }
            
            // Grab a datbase ref
            let userRef = Database.database().reference().child("users").child(uid)
            
            // Give the node of the current uid the values we created above
            userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print("ERROR UPDATING VALUES")
                    return
                }
                completion()
            })
        }
    }
    
    
    static func loginUser(email:String,password:String, completion: @escaping () -> ()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            // If there is an error
            if error != nil{
                print("ERROR LOGGING IN")
                return
            }
            
            let tempUser = User(uid: (user?.uid)!, username: email)
            
            
            User.setCurrent(tempUser, writeToUserDefaults: true)
            completion()
        }
    }
    
    static func sendResetLink(email:String, completion: @escaping () -> ()){
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            // If there is an error
            if error != nil{
                print("ERROR SENDING LINK")
                return
            }
            completion()
        }
    }
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        let ref = Database.database().reference().child("users").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let user = User(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(user)
        })
    }
    static func posts(for user: User, completion: @escaping ([Post]) -> Void) {
        let ref = Database.database().reference().child("posts").child(user.uid)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let posts = snapshot.reversed().flatMap(Post.init)
            completion(posts)
        })
    }
    
    
}

