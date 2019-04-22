//
//  CardViewController.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    private var cardView: CardView!
    var stats: StatsViewModels? {
        didSet {
            self.setDataCard()
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = Color.app_color_default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.cardView = CardView(frame: self.view.frame)
        self.view.addSubview(self.cardView)
    }
}

extension CardViewController {
    
    func setDataCard() {
        
        guard let stats = self.stats else {return}
        
        if let price = stats.marketPrice {
            self.cardView.priceLabel.text = price
        }
    }
}
