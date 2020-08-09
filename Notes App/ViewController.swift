//
//  ViewController.swift
//  Notes App
//
//  Created by Sagar Baloch on 09/08/2020.
//  Copyright © 2020 Sagar Baloch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myTableView:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Notes"
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

