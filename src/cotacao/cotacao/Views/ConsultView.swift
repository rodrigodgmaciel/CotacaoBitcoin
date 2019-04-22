//
//  ConsultiView.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class ConsultView: UIView {
    
    
    lazy var firstView: UIView = {
        let view = UIView()
        
        view.backgroundColor = Color.app_color_default
        view.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: self.frame.height/3).isActive = true
        //view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .yellow
        //view.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        //view.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.firstView, self.secondView])
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ConsultView
{
    
    func setupConstraints() {
        
        self.addSubview(stackView)
        
        self.secondView.topAnchor.constraint(equalTo: self.firstView.bottomAnchor).isActive = true
        self.secondView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor).isActive = true
        self.secondView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
        self.secondView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor).isActive = true
        
        self.stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
