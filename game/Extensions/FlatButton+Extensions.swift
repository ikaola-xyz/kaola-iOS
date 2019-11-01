//
//  FlatButton+Extensions.swift
//  game
//
//  Created by Eric on 31/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit
import Material

public extension FlatButton{
    
    func styleSetting() -> Void{
        self.pulseColor = UIColor.grayLight()
        self.titleColor = UIColor.grayDark()
        self.backgroundColor = UIColor.white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: PADDING_DEFAULT, bottom: 0, right: 0)
    }
}
