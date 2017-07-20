//
//  JoinAsViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/19/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit
import FirebaseCore
import Firebase


class JoinAsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var joinAsLabel: UILabel!
    
    @IBOutlet weak var joinAsButton: UIButton!
    
    
    @IBOutlet weak var pickerViewButton: UIPickerView!
    
    let catagory = ["Student", "Mentor", "Recruiter"]
    
    var selectIndex = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectIndex = row
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
        pickerViewButton.dataSource = self
        pickerViewButton.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if catagory[selectIndex] == "Student" {
            self.performSegue(withIdentifier: "joinasastudent", sender: sender)
        }
        
        if catagory[selectIndex] == "Mentor" {
            self.performSegue(withIdentifier: "joinasamentor", sender: sender)
        }
        
        if catagory[selectIndex] == "Recruiter" {
            self.performSegue(withIdentifier: "joinasarecruiter", sender: sender)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
}
