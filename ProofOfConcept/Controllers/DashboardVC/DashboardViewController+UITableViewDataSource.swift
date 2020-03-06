//
//  DashboardViewController+UITableViewDataSource.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright © 2020 Yuvraj Sorav. All rights reserved.
//

import UIKit

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardModel?.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dashBoardCell = tableview.dequeueReusableCell(withIdentifier: dashboardReuseIdentifier, for: indexPath) as? DashboardCell else {
            return UITableViewCell()
        }
        if let rows = dashboardModel?.rows {
            dashBoardCell.setUpCell(rows, indexPath)
        }
        return dashBoardCell
    }
    
}

