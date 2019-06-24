//
//  EditorPresenter.swift
//  game
//
//  Created by Eric on 24/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

class EditorPresenter{
    
    var strategyModel: StrategyModel!
    
    init() {
        self.strategyModel = StrategyModel()
    }
    
    func publish(title: String, content: String){
        strategyModel.publish(userId: "5cef5fc96e0f4964c7d55450", gameId: "5cef8b7f46e0fb00017bff4d", title: title, content: content)
    }
}
