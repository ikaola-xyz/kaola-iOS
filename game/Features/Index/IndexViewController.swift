//
//  IndexViewController.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class IndexViewController: TableViewController, IndexViewDelegate {

    var indexPresenter: IndexPresenter!
    
    var strategies: Array<Strategy>!
    
    let identifier = "StrategyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViews()
    }
    
    func initViews(){
        strategies = Array<Strategy>()
        tableView.register(StrategyCell.self, identifier: identifier)
        
        indexPresenter = IndexPresenter(view: self)
        indexPresenter.getStrategies()
    }
    
    func showStategies(result: Array<Strategy>) {
        self.strategies.append(contentsOf: result)
        reloadData()
    }
    
    override func getItemHeight(_ position: Int) -> CGFloat {
        return StrategyCell.HEIGHT
    }
    
    override func getItemCount() -> Int {
        return self.strategies.count
    }
    
    override func createCell(_ indexPath: IndexPath) -> UITableViewCell {
        print("IndexViewController createCell")
        let position = indexPath.row
        let strategy = strategies[position]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! StrategyCell
        cell.bindData(strategy: strategy)
        return cell
    }
    
    override func onItemClick(_ position: Int) {
        let detailViewController = DetailViewController()
        detailViewController.strategy = strategies[position]
        push(viewController: detailViewController)
    }

}
