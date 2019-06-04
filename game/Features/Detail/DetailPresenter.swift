//
//  DetailPresenter.swift
//  game
//
//  Created by Eric on 4/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

protocol DetailViewDelegate {
    
    func showStrategy(strategy: Strategy) -> Void
}

class DetailPresenter{
    
    var viewDelegate: DetailViewDelegate!
    
    var strategyModel: StrategyModel!
    
    init(view: DetailViewDelegate) {
        self.viewDelegate = view
        self.strategyModel = StrategyModel()
    }
    
    func getStrategy(id: String){
        strategyModel.getById(id: id) { (strategy) in
            self.viewDelegate.showStrategy(strategy: strategy)
        }
    }
}
