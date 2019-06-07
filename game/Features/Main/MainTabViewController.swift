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
    
    let v1 = IndexViewController()
    let v2 = MineViewController()
    let v3 = MineViewController()
    let v4 = MineViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "考拉"
        self.delegate = self
        initViews()
    }
    
    func initViews(){
        self.viewControllers = [v1, v2, v3, v4]
        v1.tabBarItem.title = "首页"
        v2.tabBarItem.title = "推荐"
        v3.tabBarItem.title = "社区"
        v4.tabBarItem.title = "我的"
        
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: HEIGHT_TOOL_BAR)
//        titleView.backgroundColor = UIColor.window()
        
        let searchView = UILabel()
        searchView.frame = CGRect(x: 0, y: 0, width: ScreenWidth-16, height: 36)
        searchView.layer.borderColor = UIColor.window().cgColor
        searchView.layer.cornerRadius = 5
        searchView.layer.masksToBounds = true
        searchView.font = UIFont.systemFont(ofSize: 13)
        searchView.backgroundColor = UIColor.window()
        searchView.textColor = UIColor.grayDark()
        searchView.text = "搜索感兴趣的攻略..."
        searchView.textAlignment = .center
        titleView.addSubview(searchView)
        
        self.navigationItem.titleView = titleView
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.barTintColor = UIColor.window()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.barTintColor = UIColor.window()
//    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
}