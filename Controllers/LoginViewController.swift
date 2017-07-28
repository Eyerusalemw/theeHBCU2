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
    
//    func firebaseAuth(_ credential: AuthCredential) {
//        Auth.auth().signIn(with: credential, completion: { (user, error) in
//            if error != nil {
//                print("unable to authenticate with Firebase - \(error)" )
//            } else {
//                print("successfully authenticated with Firebase")
//            }
//            })
//    }
//    
    
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
        func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
            if let error = error {
                assertionFailure("Error signing in: \(error.localizedDescription)")
                return
            }
            
            guard let user = user else {return}
            
            let userRef = Database.database().reference().child("users").child(user.uid)
            
            
            //when existing user comes redirect them to the main storyboard by setting the window's root view controller
            userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
                
                UserService.show(forUID: user.uid) { (user) in
                    
                    if let user = user {
                        // handle existing user
                        User.setCurrent(user, writeToUserDefaults: true)
                        
                        let initialViewController = UIStoryboard.initialViewController(for: .main)
                        self.view.window?.rootViewController = initialViewController
                        self.view.window?.makeKeyAndVisible()
                    }
//                    else {
//                        // handle new user
//                        self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
//                    }
                    
                }
                }
            )
        }

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
            self.performSegue(withIdentifier: "logintomainview", sender: self)
        
        }
        

    
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        // Dissmiss screen
        self.dismiss(animated: true, completion: nil)

    }
    
}


