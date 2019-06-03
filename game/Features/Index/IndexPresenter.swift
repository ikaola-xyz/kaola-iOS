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
    
    func getStrategies(){
        print("IndexPresenter getStrategies")
        model.getAll { (strategies) in
            self.view?.showStategies(result: strategies)
        }
    }
}
