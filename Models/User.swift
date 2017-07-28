//
//  User.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/18/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot
import UIKit


class User: NSObject {
    let uid: String
    let username: String
    var isFollowed = false
    
    
    // - singleton
    private static var _current: User?
    
    static var current: User{
        guard let currentUser = _current else { fatalError("Error: current user doesnt exist")}
        return currentUser
    }
    
    
    
    //
    //    static func setCurrent(_ user: User) {
    //        _current = user
    //
    //    }
    
    init (uid: String, username: String){
        self.uid = uid
        self.username = username
        
        super.init()
    }
    
    init?(snapshot: DataSnapshot){
        guard let dict = snapshot.value as? [String: Any],
            let username = dict ["username"] as? String
            else { return nil }
        self.uid = snapshot.key
        self.username = username
        
        super.init()
    }
    //This allows users to be decoded from data
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String
            else { return nil }
        
        self.uid = uid
        self.username = username
        
        super.init()
    }
    // store the data for our current user with the correct key in UserDefaults
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        
        if writeToUserDefaults {
            
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        
        _current = user
    }
    
}


extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey:Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
    }
}

