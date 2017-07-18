//
//  ForgotPasswordViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/18/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.alpha = 0 //making sure our activity indicator is invisible
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendResetLinkedButtonTapped(_ sender: Any) {
        activityIndicator.alpha = 1 // Make sure our activity indicator is visible
        activityIndicator.startAnimating() // Animate
        
        // If there is text in the email textfield if not, return the function
        guard let email = emailTextField.text, !email.isEmpty else {
            return
            
        }
        UserService.sendResetLink(email: email) {
            
            // When its done
            self.activityIndicator.stopAnimating() // Stop animation
            self.activityIndicator.alpha = 0 // Make it invisible
            
            // Create alert
            let alert = UIAlertController(title: "Email Sent", message: "An email was sent to  \(email). Please check your email.", preferredStyle: .alert)
            
            // Present alert
            self.present(alert, animated: true)
            
            // Add a button to alert
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        }
    }
}


