//
//  Reachability.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 06/03/20.
//  Copyright © 2020 Yuvraj Sorav. All rights reserved.
//

import Alamofire

class Reachability {
    
    class func checkInternetConnection() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
