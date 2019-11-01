//
//  LoginViewController.swift
//  game
//
//  Created by Eric on 23/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import Material

class LoginViewController: ToolBarViewController {

    var tfUsername: UITextField!
    
    var tfPassword: UITextField!
    
    var btnSubmit: RaisedButton!
    
    var tokenModel: TokenModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        tokenModel = TokenModel()
        initViews()
    }
    
    func initViews(){
        tfUsername = UITextField()
        tfUsername.frame = CGRect(x: 20, y: 180, width: ScreenWidth - 40, height: 48)
        tfUsername.placeholder = "请输入邮箱/手机号"
        
        tfPassword = UITextField()
        tfPassword.frame = CGRect(x: 20, y: tfUsername.frame.maxY + 20, width: ScreenWidth - 40, height: 48)
        tfPassword.placeholder = "请输入密码"
        tfPassword.isSecureTextEntry = true
        
        btnSubmit = RaisedButton(title: "登录", titleColor: .white)
        btnSubmit.depthPreset = DepthPreset.none
        btnSubmit.cornerRadiusPreset = CornerRadiusPreset.cornerRadius5
        btnSubmit.frame = CGRect(x: 20, y: tfPassword.frame.maxY + 30, width: ScreenWidth - 40, height: 50)
        btnSubmit.pulseColor = UIColor.primary()
        btnSubmit.backgroundColor = UIColor.primary()
        btnSubmit.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btnSubmit.addTarget(self, action: #selector(LoginViewController.login), for: .touchUpInside)

        addSubview(tfUsername)
        addSubview(tfPassword)
        addSubview(btnSubmit)
    }
    
    @objc func login(){
        let username = tfUsername.text
        let password = tfPassword.text
        tokenModel.post(email: username!, password: password!, success: { (token) in
            LoginManager.onLoginSucceeded(token: token)
            self.view.makeToast("登录成功")
            self.pop()
        }, error: {
            self.view.makeToast("登录失败")
        })
    }
}
