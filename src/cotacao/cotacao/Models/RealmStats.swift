//
//  RealmStats.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation
import RealmSwift

class RealmStats: Object, Decodable {
    
    @objc dynamic var timestamp = 0
    @objc dynamic var market_price_usd : Double = 0.0
    @objc dynamic var hash_rate : Double = 0.0
    @objc dynamic var total_fees_btc = 0
    @objc dynamic var n_btc_mined = 0
    @objc dynamic var n_tx = 0
    @objc dynamic var n_blocks_mined = 0
    @objc dynamic var minutes_between_blocks : Double = 0.0
    @objc dynamic var totalbc = 0
    @objc dynamic var n_blocks_total = 0
    @objc dynamic var estimated_transaction_volume_usd : Double = 0.0
    @objc dynamic var blocks_size = 0
    @objc dynamic var miners_revenue_usd : Double = 0.0
    @objc dynamic var nextretarget = 0
    @objc dynamic var difficulty = 0
    @objc dynamic var estimated_btc_sent = 0
    @objc dynamic var miners_revenue_btc = 0
    @objc dynamic var total_btc_sent = 0
    @objc dynamic var trade_volume_btc : Double = 0.0
    @objc dynamic var trade_volume_usd : Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        
        case timestamp = "timestamp"
        case market_price_usd = "market_price_usd"
        case hash_rate = "hash_rate"
        case total_fees_btc = "total_fees_btc"
        case n_btc_mined = "n_btc_mined"
        case n_tx = "n_tx"
        case n_blocks_mined = "n_blocks_mined"
        case minutes_between_blocks = "minutes_between_blocks"
        case totalbc = "totalbc"
        case n_blocks_total = "n_blocks_total"
        case estimated_transaction_volume_usd = "estimated_transaction_volume_usd"
        case blocks_size = "blocks_size"
        case miners_revenue_usd = "miners_revenue_usd"
        case nextretarget = "nextretarget"
        case difficulty = "difficulty"
        case estimated_btc_sent = "estimated_btc_sent"
        case miners_revenue_btc = "miners_revenue_btc"
        case total_btc_sent = "total_btc_sent"
        case trade_volume_btc = "trade_volume_btc"
        case trade_volume_usd = "trade_volume_usd"
    }
    
}

extension RealmStats {
    
    convenience init(stats: Stats) {
        
        self.init()
        
        self.timestamp = stats.timestamp!
        self.market_price_usd = stats.market_price_usd!
        self.hash_rate = stats.hash_rate!
        self.total_fees_btc = stats.total_fees_btc!
        self.n_btc_mined = stats.n_btc_mined!
        self.n_tx = stats.n_tx!
        self.n_blocks_mined = stats.n_blocks_mined!
        self.minutes_between_blocks = stats.minutes_between_blocks!
        self.totalbc = stats.totalbc!
        self.n_blocks_total = stats.n_blocks_total!
        self.estimated_transaction_volume_usd = stats.estimated_transaction_volume_usd!
        self.blocks_size = stats.blocks_size!
        self.miners_revenue_usd = stats.miners_revenue_usd!
        self.nextretarget = stats.nextretarget!
        self.difficulty = stats.difficulty!
        self.estimated_btc_sent = stats.estimated_btc_sent!
        self.miners_revenue_btc = stats.miners_revenue_btc!
        self.total_btc_sent = stats.total_btc_sent!
        self.trade_volume_btc = stats.trade_volume_btc!
        self.trade_volume_usd = stats.trade_volume_usd!
        
    }
    
    var stats: Stats {
        return Stats( timestamp : timestamp,
                      market_price_usd : market_price_usd,
                      hash_rate : hash_rate,
                      total_fees_btc : total_fees_btc,
                      n_btc_mined : n_btc_mined,
                      n_tx : n_tx,
                      n_blocks_mined : n_blocks_mined,
                      minutes_between_blocks : minutes_between_blocks,
                      totalbc : totalbc,
                      n_blocks_total : n_blocks_total,
                      estimated_transaction_volume_usd : estimated_transaction_volume_usd,
                      blocks_size : blocks_size,
                      miners_revenue_usd : miners_revenue_usd,
                      nextretarget : nextretarget,
                      difficulty : difficulty,
                      estimated_btc_sent : estimated_btc_sent,
                      miners_revenue_btc : miners_revenue_btc,
                      total_btc_sent : total_btc_sent,
                      trade_volume_btc : trade_volume_btc,
                      trade_volume_usd : trade_volume_usd
        )
    }
}


