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
    
    func publish(title: String, content: String, callback: @escaping (Int)->Void){
        strategyModel.publish(userId: LoginManager.getUser().id,
                              gameId: "5cef8b7f46e0fb00017bff4d",
                              title: title,
                              content: content,
                              cover: "",
                              callback: callback)
    }
}
