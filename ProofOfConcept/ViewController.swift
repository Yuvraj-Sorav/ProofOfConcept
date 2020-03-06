//
//  ViewController.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright © 2020 Yuvraj Sorav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let tableview = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }

    
    func configureTableView() {
//        tableview.dataSource = self
        tableview.estimatedRowHeight = 100
        tableview.rowHeight = UITableView.automaticDimension
//        tableview.register(BookTableViewCell.self, forCellReuseIdentifier: bookCellReuseIdentifier)
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

