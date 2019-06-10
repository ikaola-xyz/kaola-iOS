//
//  StrategyCell.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class StrategyCell: UITableViewCell {
    
    static let HEIGHT : CGFloat = 18 + 14*3 + PADDING_DEFAULT*3 + 8 + 20 + PADDING_MIDDLE
    
    var title: UILabel!
    
    var summary: UILabel!
    
    var avatar: UIImageView!
    
    var username: UILabel!
    
    var created: UILabel!
    
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
        summary.frame = CGRect(x: PADDING_DEFAULT, y: title.frame.maxY + PADDING_DEFAULT, width: ScreenWidth - PADDING_DEFAULT*2, height: 14)
        summary.font = UIFont.systemFont(ofSize: 14)

        avatar = UIImageView()
        avatar.frame = CGRect(x: PADDING_DEFAULT, y: summary.frame.maxY + PADDING_SMALL, width: 20, height: 20)
        avatar.backgroundColor = UIColor.gray
        avatar.setImageWithName("AppIcon")
        avatar.setOval()
        
        username = UILabel()
        username.frame = CGRect(x: avatar.frame.maxX + 10, y: avatar.frame.minY, width: 100, height: 12)
        username.font = UIFont.systemFont(ofSize: 12)
        username.textColor = UIColor.grayMiddle()
        
        created = UILabel()
        created.frame = CGRect(x: ScreenWidth - 100, y: avatar.frame.minY, width: 100, height: 12)
        created.font = UIFont.systemFont(ofSize: 12)
        created.textColor = UIColor.grayMiddle()
        created.backgroundColor = UIColor.green
        created.textAlignment = .right
        
        self.backgroundColor = UIColor.window()
        self.contentView.addSubview(title)
        self.contentView.addSubview(summary)
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(username)
    }
    
    func bindData(strategy: Strategy){
        title.text = strategy.title
        summary.text = strategy.summary
        summary.adjustHeight(numberOfLines: 3)
        avatar.setY(summary.frame.maxY + PADDING_MIDDLE)
        
        username.setY(avatar.frame.minY + 4)
        username.text = strategy.user.nickname
        
        created.setY(avatar.frame.minY + 4)
        created.text = TimeUtils.toTimeString(timestamp: strategy.created)
    }
}
