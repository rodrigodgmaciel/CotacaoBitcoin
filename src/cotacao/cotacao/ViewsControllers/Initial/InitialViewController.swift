//
//  InitialViewController.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit


protocol InitialViewControllerDelegate: class {
    
    func consultViewController(_ controller: InitialViewController)
}

class InitialViewController: UIViewController {
    
    private weak var delegate: InitialViewControllerDelegate?
    private var initialView: InitialView!

    init(delegate: InitialViewControllerDelegate? = nil) {
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = Color.app_color_default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialView = InitialView(frame: UIScreen.main.bounds)
        self.view.addSubview(self.initialView)
        
        self.initialView.consultButton.addTarget(self, action: #selector(self.consultButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
}

extension InitialViewController {
    
    @objc func consultButtonTapped(_ sender: AnyObject) {
        
        self.delegate?.consultViewController(self)
        
    }
}
