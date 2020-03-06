//
//  DashboardRowsModel.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright © 2020 Yuvraj Sorav. All rights reserved.
//

import UIKit

struct DashboardRowsModel: Codable {
    
    let title: String?
    let description: String?
    let imageHref: String?
    
    init(title: String, description: String, imageHref: String) {
        self.title = title
        self.description = description
        self.imageHref = imageHref
    }
}
