//
//  GameCell.swift
//  game
//
//  Created by Eric on 16/9/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

    static let HEIGHT : CGFloat = 180 + 32
    
    var title: UILabel!
    
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
        cover = UIImageView()
        cover.frame = CGRect(x: PADDING_DEFAULT, y: PADDING_DEFAULT, width: ScreenWidth, height: 180)
        cover.backgroundColor = UIColor.grayLight()
        self.contentView.addSubview(cover)

        title = UILabel()
        title.frame = CGRect(x: PADDING_DEFAULT, y: PADDING_DEFAULT, width: ScreenWidth - PADDING_DEFAULT * 2, height: 18)
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.numberOfLines = 1
        title.textColor = UIColor.grayDark()
        
        self.contentView.addSubview(title)
    }
    
    func bindData(game: Game){
        title.text = game.name
    }
}
