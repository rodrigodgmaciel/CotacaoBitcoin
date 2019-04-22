//
//  BitcoinProtocol.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation

protocol BitcoinProtocol {
    
    func stats(completion: @escaping (Error?) -> ())
}
