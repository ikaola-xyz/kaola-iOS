//
//  GameGridCell.swift
//  game
//
//  Created by Eric on 13/11/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit

class GameGridCell: UICollectionViewCell {
    
    static let HEIGHT : CGFloat = 120
    
    static let WIDTH : CGFloat = ScreenWidth / 2
    
    let COVER_HEIGHT : CGFloat = 120 - PADDING_SMALL * 2 - 16 - 10
    
    let COVER_WIDTH : CGFloat = (ScreenWidth - PADDING_DEFAULT * 3) / 2
    
    var title: UILabel!
    
    var cover: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        cover = UIImageView()
        cover.frame = CGRect(x: 0, y: 0, width: COVER_WIDTH, height: COVER_HEIGHT)
        cover.backgroundColor = UIColor.border()
        cover.centerCrop()
        self.contentView.addSubview(cover)
        
        title = UILabel()
        title.frame = CGRect(x: PADDING_SMALL, y: cover.frame.maxY + 10, width: COVER_WIDTH, height: 16)
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.numberOfLines = 1
        title.textColor = UIColor.grayDark()
        self.contentView.addSubview(title)
    }
    
    func bindData(game: Game, position: Int){
        title.text = game.name
        if(game.cover != nil){
            cover.setImageWithUrl(game.cover)
        }
        
        if(position%2 == 0){
            cover.frame = CGRect(x: PADDING_DEFAULT, y: 0, width: COVER_WIDTH, height: COVER_HEIGHT)
            title.frame = CGRect(x: PADDING_DEFAULT, y: cover.frame.maxY + 10, width: COVER_WIDTH, height: 16)
        }else{
            cover.frame = CGRect(x: PADDING_SMALL, y: 0, width: COVER_WIDTH, height: COVER_HEIGHT)
            title.frame = CGRect(x: PADDING_SMALL, y: cover.frame.maxY + 10, width: COVER_WIDTH, height: 16)
        }
    }
}
