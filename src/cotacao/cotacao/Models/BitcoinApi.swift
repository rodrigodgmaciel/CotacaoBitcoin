//
//  BitcoinApi.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit
import RealmSwift

class BitcoinApi: BitcoinProtocol {
    
    lazy var realmDataSoure = RealmDataSource()
    
    func stats(completion: @escaping (Error?) -> ()) {
        
        let url = URL(string: Constants.baseUrlStats)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                completion(error)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if(httpResponse.statusCode == 200) {
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        let responseModel = try jsonDecoder.decode(RealmStats.self, from: data!)
                        self.realmDataSoure.addStats(realmStats: responseModel)
                        completion(nil)
                    }catch {
                        completion(error)
                    }
                    
                } else {
                    
                    if let error = error {
                        completion(error)
                    } else {
                        let errorTemp = NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Falha ao obter dados."])
                        
                        completion(errorTemp)
                    }
                }
            }
            }.resume()
        
    }
    
}
