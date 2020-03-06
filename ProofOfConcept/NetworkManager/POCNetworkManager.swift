//
//  POCNetworkManager.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright © 2020 Yuvraj Sorav. All rights reserved.
//

import UIKit
import SVProgressHUD

enum NetworkError: Error {
    case domainError
}

class POCNetworkManager {
    
    static let sharedManager = POCNetworkManager()
    
    func makeGetRequest(urlString: String, completion:@escaping (Result<Data,NetworkError>) -> Void){

        guard let url = URL(string: urlString) else {
            completion(.failure(.domainError))
            return
        }
        SVProgressHUD.show()
        URLSession.shared.dataTask(with: url) { data, response, error in
            SVProgressHUD.dismiss()
            guard let urlData = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                        completion(.failure(.domainError))
                }
                return
            }
            
            let str = String(data: urlData, encoding: .isoLatin1)
            guard let dataUTF8 = str?.data(using: .utf8) else {
                return
            }
            completion(.success(dataUTF8))
        }.resume()
    }
}
