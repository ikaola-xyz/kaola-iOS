//
//  GamesPresenter.swift
//  game
//
//  Created by Eric on 16/9/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

protocol GamesViewDelegate {
    
    func showGames(result: Array<Game>) -> Void
}

class GamesPresenter{
    
    var view: GamesViewDelegate?
    
    let model = GameModel()
    
    init(view: GamesViewDelegate){
        self.view = view
    }
    
    func getGames(){
        model.getAll { (games) in
            self.view?.showGames(result: games)
        }
    }
}
