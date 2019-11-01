//
//  MineViewController.swift
//  game
//
//  Created by Eric on 2019/6/2.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import Material

class MineViewController: BaseViewController {

    var avatar: UIImageView!
    
    var nickname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        showUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
          self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func initViews(){
        let topBlock = FlatButton(title: "", titleColor: UIColor.grayMiddle())
        topBlock.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 200)
        topBlock.styleSetting()
        topBlock.addTarget(self, action: #selector(profile), for: .touchUpInside)
        addSubview(topBlock)

        avatar = UIImageView()
        avatar.frame = CGRect(x: PADDING_DEFAULT, y: topBlock.frame.height - 30 - 66, width: 66, height: 66)
        avatar.setImageWithName("ic_default_avatar")
        avatar.setOval()
        addSubview(avatar)
        
        nickname = UILabel()
        nickname.frame = CGRect(x: avatar.frame.maxX + PADDING_DEFAULT,
                                y: topBlock.frame.height - 30 - (avatar.getHeight() + 18)/2,
                                width: 100,
                                height: 18)
        nickname.fontSize = 18
        addSubview(nickname)
        
        let btnStrategies = FlatButton(title: "我的帖子", titleColor: UIColor.grayMiddle())
        btnStrategies.frame = CGRect(x: 0 , y: topBlock.frame.maxY + PADDING_MIDDLE, width: ScreenWidth, height: 56)
        btnStrategies.styleSetting()
        addSubview(btnStrategies)
        
        let btnFav = FlatButton(title: "我的收藏", titleColor: UIColor.grayMiddle())
        btnFav.frame = CGRect(x: 0 , y: btnStrategies.frame.maxY, width: ScreenWidth, height: 56)
        btnFav.styleSetting()
        addSubview(btnFav)
        
        let btnFollows = FlatButton(title: "我的关注", titleColor: UIColor.grayMiddle())
        btnFollows.frame = CGRect(x: 0 , y: btnFav.frame.maxY, width: ScreenWidth, height: 56)
        btnFollows.styleSetting()
        addSubview(btnFollows)
        
        let btnSettings = FlatButton(title: "设置", titleColor: UIColor.grayMiddle())
        btnSettings.frame = CGRect(x: 0 , y: btnFollows.frame.maxY + PADDING_MIDDLE, width: ScreenWidth, height: 56)
        btnSettings.styleSetting()
        addSubview(btnSettings)
    }
    
    func showUser(){
        if(LoginManager.isLogin()){
            nickname.text = LoginManager.getUser().nickname
            avatar.setImageWithUrl(LoginManager.getUser().avatar)
        }
    }
    
    @objc func profile(){
        let profileViewController = ProfileViewController()
        push(viewController: profileViewController)
    }
}
