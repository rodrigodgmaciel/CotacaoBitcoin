//
//  ConsultViewController.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit
import RealmSwift

class ConsultViewController: UIViewController {
    
    private var consultView: ConsultView!
    private var cardViewController: CardViewController!
    private var evolutionTableViewController: EvolutionTableViewController!
    private lazy var consultViewModel = ConsultViewModel()
    private lazy var realmDataSource = RealmDataSource()
    var notificationToken: NotificationToken? = nil
    
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = Color.app_color_default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Bitcoin"
        
        self.consultView = ConsultView(frame: self.view.frame)
        self.view.addSubview(self.consultView)
        
        setupCardView()
        setupEvolutionView()
        self.loadDataBase()
        self.loadStats()
    }
    
    deinit {
        self.notificationToken?.invalidate()
    }
}

extension ConsultViewController {
    
    func setupCardView() {
        
        self.cardViewController = CardViewController()
        self.addChild(self.cardViewController)
        self.cardViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.consultView.firstView.addSubview(self.cardViewController.view)
        setupConstraintsCardView()
        self.cardViewController.didMove(toParent: self)
        
    }
    
    func setupEvolutionView() {
        
        self.evolutionTableViewController = EvolutionTableViewController()
        self.addChild(self.evolutionTableViewController)
        self.evolutionTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.consultView.secondView.addSubview(self.evolutionTableViewController.view)
        setupConstraintsEvolutionView()
        self.evolutionTableViewController.didMove(toParent: self)
    }
    
    func setupConstraintsCardView(){
        
        let margins = self.consultView.firstView.layoutMarginsGuide
        
        self.cardViewController.view.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.cardViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.cardViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.cardViewController.view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
    }
    
    func setupConstraintsEvolutionView() {
        let margins = self.consultView.secondView.layoutMarginsGuide
        
        self.evolutionTableViewController.view.topAnchor.constraint(equalTo: self.consultView.secondView.topAnchor).isActive = true
        self.evolutionTableViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.evolutionTableViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.evolutionTableViewController.view.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}

extension ConsultViewController: MessagePresenter {
    
    func loadStats(){
      
        consultViewModel.stats() { [weak self] error in
            guard let strongSelf = self else {return}
        
            if(error != nil) {
                strongSelf.showErrorMessage(error: error?.localizedDescription)
            }
        }
    }
    
    func loadDataBase() {
        
        let results = self.realmDataSource.getResultRealmStats()
        
        notificationToken = results.observe{ [weak self] (changes: RealmCollectionChange) in
            
            guard let strongSelf = self else {return}
            
            switch changes {
                
            case .initial(_):
                
                if let stats = results.last?.stats {
                    strongSelf.reloadCard(stats: StatsViewModels(stats:stats))
                }
                
            case .update(_, _, _, _):
                if let stats = results.last?.stats
                {
                    strongSelf.reloadCard(stats: StatsViewModels(stats:stats))
                }
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
    
    func reloadCard(stats: StatsViewModels) {
        self.cardViewController.stats = stats
    }
    
}
