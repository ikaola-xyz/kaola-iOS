//
//  SearchViewController.swift
//  game
//
//  Created by Eric on 2019/6/8.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: HEIGHT_TOOL_BAR)
        
        let searchView = UITextField()
        searchView.frame = CGRect(x: 0, y: 0, width: ScreenWidth - 4 - 10 - 50, height: 36)
        searchView.layer.borderColor = UIColor.white.cgColor
        searchView.layer.cornerRadius = 5
        searchView.layer.masksToBounds = true
        searchView.font = UIFont.systemFont(ofSize: 13)
        searchView.backgroundColor = UIColor.inputView()
        searchView.textColor = UIColor.grayLight()
        searchView.placeholder = "搜索感兴趣的攻略..."
        searchView.textAlignment = .left
        searchView.isUserInteractionEnabled = true
        searchView.setLeftPadding(16)
        searchView.setRightPadding(16)
        searchView.becomeFirstResponder()
        
        let cancel = UILabel()
        cancel.frame = CGRect(x: searchView.frame.maxX + 4, y: 0, width: 50, height: 36)
        cancel.textAlignment = .center
        cancel.font = UIFont.systemFont(ofSize: 16)
        cancel.text = "取消"
        cancel.isUserInteractionEnabled = true
        let tapCancel = UITapGestureRecognizer.init(target: self, action: #selector(SearchViewController.clickCancel))
        cancel.addGestureRecognizer(tapCancel)
        
        titleView.addSubview(searchView)
        titleView.addSubview(cancel)
        self.navigationItem.titleView = titleView
        self.navigationItem.hidesBackButton = true
    }
    
    @objc func clickCancel(){
        finish()
    }
}
