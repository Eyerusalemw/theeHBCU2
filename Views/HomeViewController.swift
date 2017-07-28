//
//  HomeViewController.swift
//  theeHBCU
//
//  Created by Eyerusalem Woldu on 7/26/17.
//  Copyright © 2017 Eyerusalem Woldu. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Kingfisher



class HomeViewController:UIViewController{
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    
        
        UserService.posts { (posts) in
            self.posts = posts
            print(posts.count)
            self.tableview.reloadData()
        }
    }
    var posts = [Post]()
    
    
    func configureTableView() {
        // remove separators for empty cells
        tableview.tableFooterView = UIView()
        // remove separators from cells
        tableview.separatorStyle = .none
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath) as! PostImageCell
        
        let imageURL = URL(string: post.imageURL)
        cell.postImageView.kf.setImage(with: imageURL)
        
        return cell
        
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = posts[indexPath.row]
        
        return post.imageHeight
    }
}
