//
//  InitialView.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class InitialView: UIView {

    lazy var infoLabel: UILabel = {
       
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Ao pressionar o botão, você ficará por dentro da cotação atual do Bitcoin e sua evolução."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var consultButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Consultar Bitcoin", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = Color.button_color
        b.layer.cornerRadius = 6.2
        b.layer.masksToBounds = true
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InitialView {
    
    func setupConstraints() {
        
        self.addSubview(self.infoLabel)
        self.addSubview(self.consultButton)
        
        let marginsView = self.layoutMarginsGuide
        
        self.infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        self.infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        self.consultButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        self.consultButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        self.consultButton.centerXAnchor.constraint(equalTo: marginsView.centerXAnchor).isActive = true
        self.consultButton.centerYAnchor.constraint(equalTo: marginsView.centerYAnchor).isActive = true
        self.consultButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        //label acima do botão
        self.infoLabel.bottomAnchor.constraint(equalTo: self.consultButton.topAnchor, constant: -20).isActive = true
    }
}
