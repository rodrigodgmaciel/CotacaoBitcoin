//
//  ConsultViewModel.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation

class ConsultViewModel {
    
    func stats(completion: @escaping (Error?) -> ()) {
        let api = BitcoinApi()
        api.stats() { error in
            
            if error != nil {
                debugPrint(error ?? "Stats - ocorreu um erro.")
                completion(error)
            } 
        }
    }
}
