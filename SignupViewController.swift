//
//  SignupViewController.swift
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



class SignupViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        // If there is text in the email textfield if not, return the function
        guard let email = emailTextField.text, !email.isEmpty else {
            return
        }
        // If there is text in the fullName if not, return the function
        guard let fullName = fullNameTextField.text, !fullName.isEmpty else {
            return
        }
        // If there is text in the passwordTextField if not, return the function
        guard let password = passwordTextField.text, !password.isEmpty else {
            return
        }
    
        
        // Create User
        UserService.createUser(fullName: fullName, email: email, password: password) {
            // When all is done
            self.performSegue(withIdentifier: "toCreateUsername", sender: self)
        }

    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        // dismiss view
        self.dismiss(animated: true, completion: nil)
    }
    
}










