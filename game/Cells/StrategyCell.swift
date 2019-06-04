//
//  StrategyCell.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class StrategyCell: UITableViewCell {
    
    static let HEIGHT : CGFloat = 60
    
    var title: UILabel!
    
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
        title.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 16)
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.numberOfLines = 1
        title.textColor = UIColor.grayDark()
        self.contentView.addSubview(title)
    }
    
    func bindData(strategy: Strategy){
        title.text = strategy.title
    }
}
