//
//  LoginViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/17/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController{
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        print("sign up button tapped")
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("login button tapped")
        
       // add FACEBOOK SIGN IN METHOD LATER ON
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
   func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
    guard let user = user
        else { return }
    
    
    let userRef = Database.database().reference().child("users").child(user.uid)
    
    userRef.observeSingleEvent(of: .value, with: { (snapshot) in
        if let userDict = snapshot.value as? [String : Any] {
            print("User already exists \(userDict.debugDescription).")
        } else {
            print("New user!")
        }
    })
    
    }
}


