//
//  StrategyCell.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class StrategyCell: UITableViewCell {
    
    static let HEIGHT : CGFloat = 18 + 68 + PADDING_DEFAULT*2 + 8 + 20 + PADDING_MIDDLE
    
    var title: UILabel!
    
    var summary: UILabel!
    
    var avatar: UIImageView!
    
    var username: UILabel!
    
    var created: UILabel!
    
    var cover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    func initViews(){
        title = UILabel()
        title.frame = CGRect(x: PADDING_DEFAULT, y: PADDING_DEFAULT, width: ScreenWidth - PADDING_DEFAULT*2, height: 18)
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.numberOfLines = 1
        title.textColor = UIColor.grayDark()
        
        summary = UILabel()
        summary.frame = CGRect(x: PADDING_DEFAULT, y: title.frame.maxY + PADDING_DEFAULT, width: ScreenWidth - 90 - 10 - PADDING_DEFAULT*2, height: 68)
        summary.font = UIFont.systemFont(ofSize: 14)
        summary.numberOfLines = 3
        summary.textAlignment = .left
        
        cover = UIImageView()
        cover.frame = CGRect(x: ScreenWidth - 90 - 16, y: title.frame.maxY + PADDING_DEFAULT, width: 90, height: 68)
        cover.backgroundColor = UIColor.border()
        cover.centerCrop()

        avatar = UIImageView()
        avatar.frame = CGRect(x: PADDING_DEFAULT, y: cover.frame.maxY + PADDING_SMALL, width: 20, height: 20)
        avatar.backgroundColor = UIColor.gray
        avatar.setImageWithName("AppIcon")
        avatar.setOval()
        
        username = UILabel()
        username.frame = CGRect(x: avatar.frame.maxX + 10, y: avatar.frame.minY, width: 100, height: 20)
        username.font = UIFont.systemFont(ofSize: 12)
        username.textColor = UIColor.grayMiddle()
//        username.backgroundColor = UIColor.green
        
        created = UILabel()
        created.frame = CGRect(x: ScreenWidth - 110 - PADDING_DEFAULT, y: avatar.frame.minY, width: 110, height: 20)
        created.font = UIFont.systemFont(ofSize: 12)
        created.textColor = UIColor.grayMiddle()
        created.textAlignment = .right
//        created.backgroundColor = UIColor.green
        
        self.backgroundColor = UIColor.window()
        self.contentView.addSubview(title)
        self.contentView.addSubview(summary)
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(username)
        self.contentView.addSubview(created)
        self.contentView.addSubview(cover)
    }
    
    func bindData(strategy: Strategy){
        var coverWidth : CGFloat = 0
        if(strategy.cover == nil || strategy.cover.isEmpty){
            coverWidth = 0
            cover.isHidden = true
        }else{
            coverWidth = 90
            cover.isHidden = false
            cover.setImageWithUrl(strategy.cover ?? "")
        }
        
        title.text = strategy.title
        username.text = strategy.user.nickname
        if(strategy.user != nil && strategy.user.avatar != nil){
            avatar.setImageWithUrl(strategy.user.avatar)
        }
        summary.text = strategy.summary
        summary.frame = CGRect(x: PADDING_DEFAULT, y: title.frame.maxY + PADDING_DEFAULT, width: ScreenWidth - coverWidth - 10 - PADDING_DEFAULT*2, height: 68)
        summary.adjustHeight(lineSpacing: 5, numberOfLines: 3)
        created.text = TimeUtils.toTimeString(timestamp: strategy.created)
    }
}
