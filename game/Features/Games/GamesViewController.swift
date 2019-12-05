//
//  GamesViewController.swift
//  game
//
//  Created by Eric on 16/9/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GamesViewDelegate {
    
    var presenter: GamesPresenter!
    
    var games: Array<Game>!
    
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func initViews(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.itemSize = CGSize(width:GameGridCell.WIDTH, height:GameGridCell.HEIGHT)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: self.view.getHeight() - 49)
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        
        //cell
        self.collectionView.register(GameGridCell.self, forCellWithReuseIdentifier: "GameGridCell")
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.view.addSubview(collectionView)
        
        games = Array<Game>()
        
        presenter = GamesPresenter(view: self)
        presenter?.getGames()
    }
    
    func showGames(result: Array<Game>) {
        print("showGames:\(result.count)")
        self.games.append(contentsOf: result)
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : GameGridCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameGridCell", for: indexPath) as! GameGridCell
        let game = games[indexPath.row]
        cell.bindData(game: game, position: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let bookDetailViewController = BookDetailViewController()
//        bookDetailViewController.book = data[indexPath.section].books[indexPath.row]
//        self.navigationController?.pushViewController(bookDetailViewController, animated: true)
    }
}
