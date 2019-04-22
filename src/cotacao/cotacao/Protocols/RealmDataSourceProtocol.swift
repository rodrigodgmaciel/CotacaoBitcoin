//
//  RealmDataSourceProtocol.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 21/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmDataSourceProtocol {
    
    func getListStats() -> [StatsViewModels]
    func addStats(realmStats: RealmStats)
    func getResultRealmStats() -> Results<RealmStats>

    
}
