//
//  CardView.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6.5
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = Color.label_color
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.text = "Obtendo valor..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var marketPriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Preço de Mercado (USD)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black.withAlphaComponent(0.4)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Preço médio de mercado nas principais bolsas de bitcoin."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CardView {
    
    func setupConstraints() {
        
        self.addSubview(cardView)
        self.cardView.addSubview(marketPriceLabel)
        self.cardView.addSubview(priceLabel)
        self.cardView.addSubview(infoLabel)
        
        self.cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        self.cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        self.cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        self.cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    
        let marginsCardView = self.cardView.layoutMarginsGuide
        
        self.marketPriceLabel.leadingAnchor.constraint(equalTo: marginsCardView.leadingAnchor, constant: 10).isActive = true
        self.marketPriceLabel.trailingAnchor.constraint(equalTo: marginsCardView.trailingAnchor, constant: -10).isActive = true
        self.marketPriceLabel.topAnchor.constraint(equalTo: marginsCardView.topAnchor, constant: 5).isActive = true
        
        self.priceLabel.leadingAnchor.constraint(equalTo: marginsCardView.leadingAnchor, constant: 10).isActive = true
        self.priceLabel.trailingAnchor.constraint(equalTo: marginsCardView.trailingAnchor, constant: -10).isActive = true
        self.priceLabel.centerYAnchor.constraint(equalTo: marginsCardView.centerYAnchor).isActive = true
        self.priceLabel.centerXAnchor.constraint(equalTo: marginsCardView.centerXAnchor).isActive = true
        
        self.infoLabel.leadingAnchor.constraint(equalTo: marginsCardView.leadingAnchor, constant: 10).isActive = true
        self.infoLabel.trailingAnchor.constraint(equalTo: marginsCardView.trailingAnchor, constant: -10).isActive = true
        self.infoLabel.bottomAnchor.constraint(equalTo: marginsCardView.bottomAnchor, constant: 5).isActive = true
    }
}
