//
//  StudentViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/24/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit


class ToStudentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
         self.performSegue(withIdentifier: "tocontroller", sender: self)
    }
    
    
}
