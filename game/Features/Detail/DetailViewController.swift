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
    
    let footerHeight = NavgationBarHeight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        initViews()
        initFooter()
    }
    
    func initViews(){
        let webConfiguration = WKWebViewConfiguration()
        let preference = WKPreferences()
        preference.minimumFontSize = 12
        preference.javaScriptEnabled = true
        webConfiguration.preferences = preference
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.getWidth(), height: self.view.getHeight() - footerHeight), configuration: webConfiguration)
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
        if(strategy.user != nil && strategy.user.avatar != nil){
            avatar.setImageWithUrl(strategy.user.avatar)
        }else{
            avatar.setImageWithName("ic_default_avatar")
        }
        avatar.setOval()
        
        let lbUsername = UILabel()
        lbUsername.frame = CGRect(x:avatar.frame.maxX + 10, y: lbTitle.frame.maxY + 16 + 6, width: 100, height: 14)
        lbUsername.text = strategy.user.nickname

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
    
    func initFooter(){
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: ScreenHeight - footerHeight, width: ScreenWidth, height: footerHeight)
        footerView.backgroundColor = UIColor.white
        addSubview(footerView)
        
        let divier = UIView()
        divier.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 1)
        divier.backgroundColor = UIColor.border()
        footerView.addSubview(divier)
        
        let btnFav = UIButton()
        btnFav.frame = CGRect(x: ScreenWidth - 22 - 16, y: 12, width: 22, height: 22)
        btnFav.setBackgroundImage(UIImage(named: "ic_fav"), for: .normal)
        footerView.addSubview(btnFav)
        
        let lbFav = UILabel()
        lbFav.frame = CGRect(x: btnFav.frame.minX, y: btnFav.frame.maxY + 5, width: 22, height: 10)
        lbFav.fontSize = 10
        lbFav.text = "收藏"
        lbFav.textColor = UIColor.grayLight()
        lbFav.textAlignment = .center
        footerView.addSubview(lbFav)
        
        let btnPraise = UIButton()
        btnPraise.frame = CGRect(x: btnFav.frame.minX - 48, y: 12, width: 22, height: 22)
        btnPraise.setBackgroundImage(UIImage(named: "ic_praise"), for: .normal)
        footerView.addSubview(btnPraise)
        
        let lbPraise = UILabel()
        lbPraise.frame = CGRect(x: btnPraise.frame.minX - 9, y: btnPraise.frame.maxY + 5, width: 40, height: 10)
        lbPraise.fontSize = 10
        lbPraise.text = "赞999+"
        lbPraise.textColor = UIColor.grayLight()
        lbPraise.textAlignment = .center
        footerView.addSubview(lbPraise)
        
        let searchView = UILabel()
        searchView.frame = CGRect(x: 12, y: 12, width: btnPraise.frame.minX - 48, height: 36)
        searchView.layer.borderColor = UIColor.white.cgColor
        searchView.layer.cornerRadius = 18
        searchView.layer.masksToBounds = true
        searchView.font = UIFont.systemFont(ofSize: 13)
        searchView.backgroundColor = UIColor.inputView()
        searchView.textColor = UIColor.grayLight()
        searchView.text = "添加评论..."
        searchView.textAlignment = .center
        searchView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(DetailViewController.showComments))
        searchView.addGestureRecognizer(tap)
        
        footerView.addSubview(searchView)
    }
    
    @objc func showComments(){
        print("showComments")
    }
}
