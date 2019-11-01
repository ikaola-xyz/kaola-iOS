//
//  UserProfileViewController.swift
//  game
//
//  Created by Eric on 31/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import Material
var imagePicker: ImagePicker!

class ProfileViewController: ToolBarViewController, ImagePickerDelegate {
    
    var avatar: UIImageView!
    
    var nickname: UILabel!
    
    var imagePicker: ImagePicker!
    
    var userModel: UserModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人信息"
        self.view.backgroundColor = UIColor.window()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.userModel = UserModel()
        initViews()
        showUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func initViews(){
        let btnAvatar = FlatButton(title: "头像", titleColor: UIColor.grayMiddle())
        btnAvatar.frame = CGRect(x: 0 , y: HEIGHT_TOOL_BAR, width: ScreenWidth, height: 80)
        btnAvatar.styleSetting()
        btnAvatar.addTarget(self, action: #selector(changeAvatar), for: .touchUpInside)
        addSubview(btnAvatar)
        
        avatar = UIImageView()
        avatar.frame = CGRect(x: ScreenWidth - 60 - PADDING_DEFAULT, y: btnAvatar.frame.minY + 10, width: 60, height: 60)
        avatar.setImageWithName("ic_default_avatar")
        avatar.setOval()
        addSubview(avatar)
        
        let btnNickname = FlatButton(title: "昵称", titleColor: UIColor.grayMiddle())
        btnNickname.frame = CGRect(x: 0 , y: btnAvatar.frame.maxY, width: ScreenWidth, height: 56)
        btnNickname.styleSetting()
        addSubview(btnNickname)
        
        nickname = UILabel()
        nickname.frame = CGRect(x: ScreenWidth - PADDING_DEFAULT - 100, y: btnAvatar.frame.maxY, width: 100, height: 56)
        nickname.textAlignment = .right
        nickname.fontSize = 18
        nickname.textColor = UIColor.grayLight()
        addSubview(nickname)
        
        let btnIntro = FlatButton(title: "个人简介", titleColor: UIColor.grayMiddle())
        btnIntro.frame = CGRect(x: 0 , y: btnNickname.frame.maxY, width: ScreenWidth, height: 56)
        btnIntro.styleSetting()
        addSubview(btnIntro)
    }
    
    func showUserInfo(){
        nickname.text = LoginManager.getUser().nickname
        avatar.setImageWithUrl(LoginManager.getUser().avatar)
    }
    
    @objc func changeAvatar(){
        self.imagePicker.present(from: self.view)
    }
    
    func didSelect(image: UIImage?) {
        avatar.image = image
        self.view.makeToastActivity(.center)
        QiniuHelper.uploadImage(image: image!) { (hash) in
            if(hash.isEmpty){
                self.view.hideToastActivity()
                self.view.makeToast("上传失败")
            }else{
                self.updateAvatar(avatar: "http://img.ikaola.xyz/"+hash)
            }
        }
    }
    
    func updateAvatar(avatar: String){
        print("updateAvatar:" + avatar)
        let userId : String = LoginManager.getUser().id
        userModel.updateAvatar(userId: userId, avatar: avatar, success: {
            self.view.makeToast("上传成功")
            self.view.hideToastActivity()
            let user = LoginManager.getUser()
            user.avatar = avatar
            LoginManager.setUser(user: user)
        }) { (statusCode) in
            self.view.hideToastActivity()
            if(statusCode == 401){
                self.view.makeToast("授权已过期, 请重新登录")
                let loginViewController = LoginViewController()
                self.push(viewController: loginViewController)
            }
        }
    }
}
