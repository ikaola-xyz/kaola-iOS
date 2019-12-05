//
//  IndexPresenter.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

protocol IndexViewDelegate {
    
    func showStategies(result: Array<Strategy>) -> Void
}

class IndexPresenter{
    
    var view: IndexViewDelegate?
    let model = StrategyModel()
    
    init(view: IndexViewDelegate) {
        self.view = view
    }
    
    func getStrategies(page: Int){
        print("IndexPresenter getStrategies")
        model.getAll(page: page, size: 20) { (strategies) in
            self.view?.showStategies(result: strategies)
        }
    }
}
