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

        let size: CGFloat = 50
        let btnCreate = UILabel()
        btnCreate.frame = CGRect(x: ScreenWidth - size - 16,
                                 y: ScreenHeight - size - NavgationBarHeight - 16,
                                 width: size,
                                 height: size)
        btnCreate.backgroundColor = UIColor.primary()
        btnCreate.text = "+"
        btnCreate.font = UIFont.boldSystemFont(ofSize: 20)
        btnCreate.textColor = UIColor.white
        btnCreate.layer.cornerRadius = size/2
        btnCreate.layer.masksToBounds = true
        btnCreate.textAlignment = .center
        btnCreate.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(IndexViewController.create))
        btnCreate.addGestureRecognizer(tap)
        self.view.addSubview(btnCreate)
        
        fixHeight()
        setRefreshable()
        setPageable()
        indexPresenter = IndexPresenter(view: self)
        onRequestData()
    }
    
    @objc func create(){
        print("create")
        if(LoginManager.isLogin()){
            let editorViewController = EditorViewController()
            push(viewController: editorViewController)
        }else{
            let loginViewController = LoginViewController()
            push(viewController: loginViewController)
        }
    }
    
    override func onRequestData() {
        indexPresenter.getStrategies(page: pageIndex)
    }
    
    func showStategies(result: Array<Strategy>) {
        if(pageIndex == 1){
            self.strategies.removeAll()
        }
        
        self.strategies.append(contentsOf: result)
        reloadData(size: result.count)
    }
    
    override func getItemHeight(_ position: Int) -> CGFloat {
        return StrategyCell.HEIGHT
    }
    
    override func getItemCount() -> Int {
        return self.strategies.count
    }
    
    override func createCell(_ indexPath: IndexPath) -> UITableViewCell {
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
