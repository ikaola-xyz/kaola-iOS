//
//  TableViewController.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

let ITEM_TYPE_NORMAL = 0

let ITEM_TYPE_SECTION = 1

class TableViewController:ToolBarViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {
    
    var tableView : UITableView!
    
    var isLoading = false
    
    var pageable = true
    
    var footerRemoved = false
    
    var pageIndex = 1
    
    let refreshAnchor : CGFloat = -90
    
    var loading: UIActivityIndicatorView!
    
    var lbEmpty: UILabel!
    
    var enableEmpty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.getWidth(), height: self.view.getHeight()))
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.tableView.separatorColor = UIColor.border()
        //防止reload的时候跳动
        self.tableView.estimatedRowHeight = 0
        self.tableView.estimatedSectionFooterHeight = 0
        self.tableView.estimatedSectionHeaderHeight = 0
        self.view.addSubview(tableView)
        
        let loadingSize : CGFloat = 50
        loading = UIActivityIndicatorView()
        loading.frame = CGRect(x: (ScreenWidth - loadingSize)/2,
                               y: (ScreenHeight - loadingSize)/2 - HEIGHT_TOOL_BAR,
                               width: loadingSize,
                               height: loadingSize)
        
        loading.color = UIColor.primary()
        loading.startAnimating()
        self.view.addSubview(loading)
    }
    
    func setEmpty(emptyTxt: String){
        enableEmpty = true
        lbEmpty = UILabel()
        lbEmpty.frame = CGRect(x: 0, y: (ScreenHeight - 14)/2 - HEIGHT_TOOL_BAR, width: ScreenWidth, height: 14)
        lbEmpty.text = emptyTxt
        lbEmpty.isHidden = true
//        lbEmpty.fontSize = 14
//        lbEmpty.textColor = UIColor.grayLight()
        lbEmpty.textAlignment = .center
        self.view.addSubview(lbEmpty)
    }
    
    func showEmpty(){
        if(enableEmpty){
            lbEmpty.isHidden = false
        }
    }
    
    func hideEmpty(){
        if(enableEmpty){
            lbEmpty.isHidden = true
        }
    }
    
    func setRefreshable(){
//        var header: ESRefreshProtocol & ESRefreshAnimatorProtocol & ESRefreshHeaderAnimator
//        header = ESRefreshHeaderAnimator.init(frame: CGRect.zero)
//        header.pullToRefreshDescription = "下拉刷新..."
//        header.releaseToRefreshDescription = "下拉刷新..."
//        header.loadingDescription = "正在加载..."
//        let _ = self.tableView.es.addPullToRefresh(animator: header) { [weak self] in
//            self?.onRefresh()
//        }
    }
    
    func setPageable(){
//        self.footerRemoved = false
//        var footer: ESRefreshProtocol & ESRefreshAnimatorProtocol & ESRefreshFooterAnimator
//        footer = ESRefreshFooterAnimator.init(frame: CGRect.zero)
//        footer.loadingMoreDescription = "加载更多..."
//        footer.loadingDescription = "正在加载..."
//        let _ = self.tableView.es.addInfiniteScrolling(animator: footer) { [weak self] in
//            self?.onPageing()
//        }
    }
    
    func removePageFooter(){
//        if(self.tableView.es.base.footer != nil){
//            self.tableView.es.removeRefreshFooter()
//            self.footerRemoved = true
//        }
    }
    
    func registerNib(_ identifier : String){
        self.tableView.registerNib(identifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getItemCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getItemHeight((indexPath as NSIndexPath).row);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createCell(indexPath);
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false);
        onItemClick((indexPath as NSIndexPath).row);
    }
    
    func getItemCount() -> Int{
        return 0
    }
    
    func getItemHeight(_ position:Int) -> CGFloat{
        return 40
    }
    
    func getItemViewType(_ position: Int) -> Int {
        return ITEM_TYPE_NORMAL;
    }
    
    func createCell(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func onRefresh(){
        if(footerRemoved&&pageable){
            setPageable()
        }
        pageIndex = 1
        onRequestData()
    }
    
    func onPageing(){
        pageIndex += 1
        onRequestData()
    }
    
    func onRequestData(){
        isLoading = true
        hideEmpty()
    }
    
    func onItemClick(_ position : Int){
        
    }
    
    func reloadData(){
        loading.stopAnimating()
        isLoading = false
        self.tableView.reloadData()
//        tableView.es.stopPullToRefresh()
//        tableView.es.stopLoadingMore()
    }
}
