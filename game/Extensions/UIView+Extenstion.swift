//
//  UIView+Extenstion.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

public extension UIView{
    
    public func getX() -> CGFloat{
        return getOrigin().x;
    }
    
    public func getY() -> CGFloat{
        return getOrigin().y;
    }
    
    public func setX(_ x : CGFloat){
        self.frame.origin.x = x;
    }
    
    public func setY(_ y : CGFloat){
        self.frame.origin.y = y;
    }
    
    public func getWidth() -> CGFloat{
        return getSize().width;
    }
    
    public func getHeight() -> CGFloat{
        return getSize().height;
    }
    
    public func getSize() -> CGSize{
        return self.frame.size;
    }
    
    public func getFrame() -> CGRect{
        return self.frame;
    }
    
    public func getOrigin() -> CGPoint{
        return self.frame.origin;
    }
    
}
