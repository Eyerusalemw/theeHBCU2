//
//  MainViewConroller.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/21/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit



class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func toStudentTableView(_ sender: Any) {
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "mainVC") 
        self.show(viewcontroller, sender: self)
        
//        var initialViewController: UIViewController
//        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
//        initialViewController = storyBoard.instantiateViewController(withIdentifier: "mainVC") as! LoginViewController
//        
      //  self.window?.rootViewController = initialViewController
        //self.window?.makeKeyAndVisible()

        
       //        var initialViewController: UIViewController
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//       let _: Bool = KeyChainWrapper.standard.removeAllKeys()
//        initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainVC") as! ViewController
//        self.window?.rootViewController = initialViewController
//
        

    }
    
    
    
    @IBOutlet weak var toMentorTableView: UIButton!
    
    
    
    
    @IBOutlet weak var toRecruiterTableView: UIButton!
    
    
    
    
}
