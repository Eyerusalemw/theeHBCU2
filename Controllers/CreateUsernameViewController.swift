//
//  CreateUsernameViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/18/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextFieldButton: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextFieldButton.text,
            !username.isEmpty else { return }
        let userAttrs = ["username": username]
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                
                // handle newly created user here
            })
        }
    }
}


