//
//  MainTabViewController.swift
//  game
//
//  Created by Eric on 2019/6/2.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {

    let titles = ["首页","推荐","社区","我的"]
    
    let indexViewController = IndexViewController()
    let recommendViewController = MineViewController()
    let gamesViewController = GamesViewController()
    let mineViewController = MineViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "考拉"
        self.delegate = self
        initNav()
        initViews()
    }
    
    func initNav(){
        indexViewController.tabBarItem.title = "首页"
        indexViewController.tabBarItem.image = UIImage(named: "ic_nav_index")
        indexViewController.tabBarItem.selectedImage = UIImage(named: "ic_nav_index_selected")
        indexViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        recommendViewController.tabBarItem.title = "推荐"
        recommendViewController.tabBarItem.image = UIImage(named: "ic_nav_recommend")
        recommendViewController.tabBarItem.selectedImage = UIImage(named: "ic_nav_recommend_selected")
        recommendViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        gamesViewController.tabBarItem.title = "社区"
        gamesViewController.tabBarItem.image = UIImage(named: "ic_nav_group")
        gamesViewController.tabBarItem.selectedImage = UIImage(named: "ic_nav_group_selected")
        gamesViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        mineViewController.tabBarItem.title = "我的"
        mineViewController.tabBarItem.image = UIImage(named: "ic_nav_mine")
        mineViewController.tabBarItem.selectedImage = UIImage(named: "ic_nav_mine_selected")
        mineViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)

        self.viewControllers = [indexViewController, recommendViewController, gamesViewController, mineViewController]
        self.tabBar.tintColor = UIColor.primary()
    }
    
    func initViews(){
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: HEIGHT_TOOL_BAR)
        
        let searchView = UILabel()
        searchView.frame = CGRect(x: 0, y: 0, width: ScreenWidth-16, height: 36)
        searchView.layer.borderColor = UIColor.white.cgColor
        searchView.layer.cornerRadius = 5
        searchView.layer.masksToBounds = true
        searchView.font = UIFont.systemFont(ofSize: 13)
        searchView.backgroundColor = UIColor.inputView()
        searchView.textColor = UIColor.grayLight()
        searchView.text = "搜索感兴趣的攻略..."
        searchView.textAlignment = .center
        searchView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(MainTabViewController.clickSearchView))
        searchView.addGestureRecognizer(tap)
        
        titleView.addSubview(searchView)
        
        self.navigationItem.titleView = titleView
    }
    
    @objc func clickSearchView(){
        print("clickSearchView")
        let searchViewController = SearchViewController()
        push(viewController: searchViewController)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.barTintColor = UIColor.navigationBar()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.barTintColor = UIColor.navigationBar()
//    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
}
