//
//  DashboardWorker.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright (c) 2020 Yuvraj Sorav. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class DashboardWorker
{
    func doSomeWork()
    {
        
    }
    
    func doFetchDashboardData(completionHandler: @escaping(Data) -> Void) {
        let urlStr = UrlConstant.kFacts
        POCNetworkManager.sharedManager.makeGetRequest(urlString: urlStr) { (result) in
            switch result {
            case .success(let data):
                completionHandler(data)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }

    }
}
