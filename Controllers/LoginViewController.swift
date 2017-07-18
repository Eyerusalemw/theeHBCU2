//
//  LoginViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/18/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//


import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldButton: UITextField!
    
    @IBOutlet weak var passwordTextFieldButton: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        // If there is text in the email textfield if not, return the function
        guard let email = emailTextFieldButton.text, !email.isEmpty else {
            return
        }
        
        // If there is text in the passwordTextField if not, return the function
        guard let password = passwordTextFieldButton.text, !password.isEmpty else {
            return
        }
        
        UserService.loginUser(email: email, password: password){
            // When all is done
            self.performSegue(withIdentifier: "signInFromLogin", sender: self)
        }

    
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        // Dissmiss screen
        self.dismiss(animated: true, completion: nil)

    }
}

