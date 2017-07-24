//
//  TableViewCell.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/24/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//class StudentViewController: UITableViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    let catagories = ["Students"]
//    
//    //  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    //  let studentcell = UITableViewController(style: UITableViewCellStyle.default, reuseIdentifier: "studentcell")
//    //  studentcell.textLabel?.text = catagories[indexPath.row]
//    //    return(studentcell)
//    //}
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return(catagories.count)
//    }
//}
