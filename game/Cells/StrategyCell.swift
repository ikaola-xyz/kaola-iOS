//
//  StrategyCell.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class StrategyCell: UITableViewCell {
    
    static let HEIGHT : CGFloat = 18 + 14*3 + PADDING_DEFAULT*3 + 8
    
    var title: UILabel!
    
    var summary: UILabel!
    
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

        self.contentView.addSubview(title)
        self.contentView.addSubview(summary)
    }
    
    func bindData(strategy: Strategy){
        title.text = strategy.title
        summary.text = strategy.summary
        summary.adjustHeight(numberOfLines: 3)
    }
}
