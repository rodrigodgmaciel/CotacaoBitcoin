//
//  StatsViewModels.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation

final class StatsViewModels {
    
    let stats: Stats
    
    var marketPrice: String? {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        let price = formatter.string(for: stats.market_price_usd)
        return price
    }
    
    var date: String? {
        
        if let timestamp = stats.timestamp {
            let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "pt_BR")
            dateFormatter.timeZone = TimeZone.autoupdatingCurrent
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
    init(stats: Stats) {
        self.stats = stats
    }
}
