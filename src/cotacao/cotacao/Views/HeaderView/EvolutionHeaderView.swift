//
//  EvolutionHeaderView.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 21/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class EvolutionHeaderView: UITableViewHeaderFooterView {


    lazy var titleLabel: UILabel = {
        let l = UILabel(frame: .zero)
        l.text = "Histórico do Bitcoin"
        l.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .clear
        l.textColor = Color.label_color
        return l
    }()
    
    private lazy var lineView: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .groupTableViewBackground
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
        
    }()
    
    func configure() {
        
        contentView.backgroundColor = .white
        setupContraints()
    }
    
    func setupContraints() {
        
        contentView.addSubview(self.titleLabel)
        
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        contentView.addSubview(self.lineView)
        
        self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        self.lineView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }

}
