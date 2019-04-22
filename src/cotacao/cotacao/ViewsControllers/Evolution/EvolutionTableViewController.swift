//
//  EvolutionTableViewController.swift
//  cotacao
//
//  Created by Rodrigo Damacena Gamarra Maciel on 20/04/2019.
//  Copyright © 2019 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit
import RealmSwift

class EvolutionTableViewController: UITableViewController {
    
    
    lazy var realmDataSource = RealmDataSource()
    
    private var listStats: [StatsViewModels] = [] {
        didSet {
     
            if(listStats.count == 0) {self.alert()}
            self.tableView.reloadData()
        }
    }
    
    init() {
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = 180
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "EvolutionViewCell", bundle: nil), forCellReuseIdentifier: "evolutionViewCell")
        self.tableView.register(EvolutionHeaderView.self, forHeaderFooterViewReuseIdentifier: "EvolutionHeaderView")
        
        self.loadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listStats.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "evolutionViewCell", for: indexPath) as? EvolutionViewCell else {
            fatalError("Could not dequeue cell with identifier: evolutionViewCell")
        }
        
        let stats = self.listStats[indexPath.row]
        cell.priceLabel.text = stats.marketPrice
        cell.dateLabel.text = stats.date
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "EvolutionHeaderView") as! EvolutionHeaderView
        
        header.configure()
        return header
    }
}

extension EvolutionTableViewController: MessagePresenter {

    func loadData() {
        self.listStats = self.realmDataSource.getListStats()
    }
    
    func alert() {
        
        self.showMessage(message: "Não há histórico para exibir.")
    }
    
}
