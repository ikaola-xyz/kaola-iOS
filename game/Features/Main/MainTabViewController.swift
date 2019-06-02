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
    
    let v1 = MineViewController()
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
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.title = item.title
    }
}
