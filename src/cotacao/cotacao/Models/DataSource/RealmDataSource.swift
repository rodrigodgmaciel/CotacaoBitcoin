//
//  RealmDataSource.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 21/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation
import RealmSwift



class RealmDataSource: RealmDataSourceProtocol {
    
    func getListStats() -> [StatsViewModels] {
        
        let uiRealm = try! Realm()
        let results = uiRealm.objects(RealmStats.self).sorted(byKeyPath: "timestamp", ascending: false)
        if results.count > 30 {
            
            var stats: [StatsViewModels] = []
            for i in 0..<30 {
                stats.append(StatsViewModels(stats: results[i].stats))
            }
            return stats
        }
        return results.map({StatsViewModels(stats: $0.stats)})
    }
    
    func getResultRealmStats() -> Results<RealmStats> {
        
        let realm = try! Realm()
        let results = realm.objects(RealmStats.self)
        return results
    }
    
    func addStats(realmStats: RealmStats) {
        
        let uiRealm = try! Realm()
        do {
            try uiRealm.write {
                uiRealm.add(realmStats)
            }
        } catch let error {
            debugPrint(error)
        }
    }
    
//    func deleteDataBase() {
//        let realm = try! Realm()
//        try! realm.write {
//            realm.deleteAll()
//        }
//    }
}
