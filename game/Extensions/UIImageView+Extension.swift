//
//  UIImageView+Extension.swift
//  game
//
//  Created by Eric on 2019/6/4.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    
    public func setImageWithUrl(_ imageUrl : String, _ ignoreSaveModel: Bool){
        if(ignoreSaveModel){
            kf.setImage(with: URL(string:imageUrl));
        }else{
            setImageWithUrl(imageUrl)
        }
    }
    
    public func setImageWithUrl(_ imageUrl : String){
        if(!imageUrl.isEmpty){
            kf.setImage(with: URL(string:imageUrl));
        }else{
            setImageWithName("ic_action_back")
        }
    }
    
    public func setImageWithName(_ image : String){
        self.image = UIImage(named: image)
    }
    
    public func setOval(){
        setCornerRadius(self.getWidth()/2)
    }
    
    public func setCornerRadius(_ radius : CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func setBorder(_ borderWidth : CGFloat, borderColor : UIColor){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    public func centerCrop(){
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}
