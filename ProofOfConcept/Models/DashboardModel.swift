//
//  DashboardModel.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright © 2020 Yuvraj Sorav. All rights reserved.
//

import UIKit

struct DashboardModel: Codable {

    let title: String?
    let rows: [DashboardRowsModel]?
    
    init(title: String, rowsArr: [DashboardRowsModel]) {
        self.title = title
        self.rows = rowsArr
    }
}
