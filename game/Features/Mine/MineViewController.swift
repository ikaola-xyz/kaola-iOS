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
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func initViews(){
        let topBlock = UIView()
        topBlock.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 200)
        topBlock.backgroundColor = UIColor.white
        self.view.addSubview(topBlock)

        avatar = UIImageView()
        avatar.frame = CGRect(x: PADDING_DEFAULT, y: topBlock.frame.height - 30 - 66, width: 66, height: 66)
        avatar.setImageWithName("ic_default_avatar")
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
        btnStrategies.pulseColor = UIColor.grayLight()
        btnStrategies.titleColor = UIColor.grayDark()
        btnStrategies.backgroundColor = UIColor.white
        btnStrategies.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btnStrategies.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btnStrategies.contentEdgeInsets = UIEdgeInsets(top: 0, left: PADDING_DEFAULT, bottom: 0, right: 0);
        addSubview(btnStrategies)
        
        let btnFav = FlatButton(title: "我的收藏", titleColor: UIColor.grayMiddle())
        btnFav.frame = CGRect(x: 0 , y: btnStrategies.frame.maxY, width: ScreenWidth, height: 56)
        btnFav.pulseColor = UIColor.grayLight()
        btnFav.titleColor = UIColor.grayDark()
        btnFav.backgroundColor = UIColor.white
        btnFav.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btnFav.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btnFav.contentEdgeInsets = UIEdgeInsets(top: 0, left: PADDING_DEFAULT, bottom: 0, right: 0);
        addSubview(btnFav)
        
        let btnFollows = FlatButton(title: "我的关注", titleColor: UIColor.grayMiddle())
        btnFollows.frame = CGRect(x: 0 , y: btnFav.frame.maxY, width: ScreenWidth, height: 56)
        btnFollows.pulseColor = UIColor.grayLight()
        btnFollows.titleColor = UIColor.grayDark()
        btnFollows.backgroundColor = UIColor.white
        btnFollows.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btnFollows.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btnFollows.contentEdgeInsets = UIEdgeInsets(top: 0, left: PADDING_DEFAULT, bottom: 0, right: 0);
        addSubview(btnFollows)
        
        let btnSettings = FlatButton(title: "设置", titleColor: UIColor.grayMiddle())
        btnSettings.frame = CGRect(x: 0 , y: btnFollows.frame.maxY + PADDING_MIDDLE, width: ScreenWidth, height: 56)
        btnSettings.pulseColor = UIColor.grayLight()
        btnSettings.titleColor = UIColor.grayDark()
        btnSettings.backgroundColor = UIColor.white
        btnSettings.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btnSettings.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btnSettings.contentEdgeInsets = UIEdgeInsets(top: 0, left: PADDING_DEFAULT, bottom: 0, right: 0);
        addSubview(btnSettings)
    }
    
    func showUser(){
        if(LoginManager.isLogin()){
            nickname.text = LoginManager.getUser().nickname
        }
    }
    
}
