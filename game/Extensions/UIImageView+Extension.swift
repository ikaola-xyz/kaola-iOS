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

public extension UIImageView{
    
//    public func setImageWithUrl(_ imageUrl : String, _ ignoreSaveModel: Bool){
//        if(ignoreSaveModel){
//            kf.setImage(with: URL(string:imageUrl));
//        }else{
//            setImageWithUrl(imageUrl)
//        }
//    }
    
//    public func setImageWithUrl(_ imageUrl : String){
//        if(!SettingManager.isSaveModel() && !imageUrl.isEmpty){
//            kf.setImage(with: URL(string:imageUrl));
//        }else{
//            setImageWithName("cover_placeholder")
//        }
//    }
//    
//    public func setImageWithUrl(_ imageUrl : String, placeholderImage : String){
//        if(!SettingManager.isSaveModel()){
//            kf.setImage(with: URL(string:imageUrl), placeholder: UIImage(named: placeholderImage), options: nil, progressBlock: nil, completionHandler: nil)
//        }else{
//            setImageWithName("cover_placeholder")
//        }
//    }
    
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
    
}
