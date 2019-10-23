//
//  LoginViewController.swift
//  game
//
//  Created by Eric on 23/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class LoginViewController: ToolBarViewController {

    var tfUsername: UITextField!
    
    var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        initViews()
    }
    
    func initViews(){
        tfUsername = UITextField()
        tfUsername.frame = CGRect(x: 16, y: 60, width: ScreenWidth - 32, height: 48)
        
        tfPassword = UITextField()
        tfPassword.frame = CGRect(x: 16, y: tfUsername.frame.maxY + 30, width: ScreenWidth - 32, height: 48)

        addSubview(tfUsername)
        addSubview(tfPassword)
    }
}
