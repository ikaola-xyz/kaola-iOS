//
//  DetailViewController.swift
//  game
//
//  Created by Eric on 4/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: ToolBarViewController, DetailViewDelegate, UIScrollViewDelegate {

    var webView: WKWebView!
    
    var detailPresenter: DetailPresenter!
    
    var strategy: Strategy!
    
    var lbTitle: UILabel!
    
    var lbViewTotal: UILabel!
    
    var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        initViews()
    }
    
    func initViews(){
        let webConfiguration = WKWebViewConfiguration()
        let preference = WKPreferences()
        preference.minimumFontSize = 12
        preference.javaScriptEnabled = true
        webConfiguration.preferences = preference
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.getWidth(), height: self.view.getHeight()), configuration: webConfiguration)
        webView.scrollView.delegate = self
        addSubview(webView)
        initHeaderView()
        
        detailPresenter = DetailPresenter(view: self)
        detailPresenter.getStrategy(id: strategy.id)
        
        lbViewTotal.font = UIFont.systemFont(ofSize: 12)
    }
    
    func initHeaderView(){
        lbTitle = UILabel()
        lbTitle.frame = CGRect(x: 16, y: 0, width: self.view.getWidth() - 32, height: 18)
        lbTitle.text = strategy.title
        lbTitle.font = UIFont.boldSystemFont(ofSize: 18)
        lbTitle.adjustHeight(lineSpacing: 4, numberOfLines: 2)
        
        let offsetHeight = lbTitle.getHeight() + 26 + 14 + 16*3
        lbTitle.setY(-offsetHeight + 16)
        
        avatar = UIImageView()
        avatar.frame = CGRect(x: 16, y: lbTitle.frame.maxY + 16, width: 26, height: 26)
        avatar.backgroundColor = UIColor.gray
        avatar.setImageWithName("AppIcon")
        avatar.setOval()
        
        let lbUsername = UILabel()
        lbUsername.frame = CGRect(x:avatar.frame.maxX + 10, y: lbTitle.frame.maxY + 16 + 6, width: 100, height: 14)
        lbUsername.text = "Eric"

        lbViewTotal = UILabel()
        lbViewTotal.frame = CGRect(x:16, y: avatar.frame.maxY + 16, width: 100, height: 14)
        lbViewTotal.text = "阅读 \(strategy.viewTotal!)"
        
        webView.scrollView.addSubview(lbTitle)
        webView.scrollView.addSubview(avatar)
        webView.scrollView.addSubview(lbUsername)
        webView.scrollView.addSubview(lbViewTotal)
        
        webView.scrollView.contentInset = UIEdgeInsets.init(top: offsetHeight, left: 0, bottom: 0, right: 0)
    }
    
    func showStrategy(strategy: Strategy) {
        let content = HtmlUtils.htmlString(htmlString: strategy.content!)
        webView.loadHTMLString(content, baseURL: Bundle.main.resourceURL?.appendingPathComponent("Web_Assets"))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y > -160){
            self.title = strategy.title
        }else{
            self.title = ""
        }
    }
}
