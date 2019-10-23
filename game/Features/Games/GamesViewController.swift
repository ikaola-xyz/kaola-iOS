//
//  GamesViewController.swift
//  game
//
//  Created by Eric on 16/9/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class GamesViewController: TableViewController, GamesViewDelegate {

    var presenter: GamesPresenter!
    
    var games: Array<Game>!
    
    let identifier = "GameCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        games = Array<Game>()
        tableView.register(GameCell.self, identifier: identifier)
        
        presenter = GamesPresenter(view: self)
        presenter?.getGames()
    }
    
    func showGames(result: Array<Game>) {
        print("showGames:\(result.count)")
        self.games.append(contentsOf: result)
        reloadData()
    }
    
    override func getItemHeight(_ position: Int) -> CGFloat {
        return GameCell.HEIGHT
    }
    
    override func getItemCount() -> Int {
        return self.games.count
    }
    
    override func createCell(_ indexPath: IndexPath) -> UITableViewCell {
        let position = indexPath.row
        let game = games[position]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GameCell
        cell.bindData(game: game)
        return cell
    }
}
