//
//  JoinAsViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/19/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit


class JoinAsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var joinAsLabel: UILabel!
    
    @IBOutlet weak var joinAsButton: UIButton!
    
    
    @IBOutlet weak var pickerViewButton: UIPickerView!
    
    let catagory = ["Student", "Mentor", "Recruiter"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catagory[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catagory.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        joinAsLabel.text = catagory[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "continuetojoinas", sender: self)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
}
