//
//  UILabel+Extension.swift
//  game
//
//  Created by Eric on 4/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel{
    
    func adjustHeight(lineSpacing : CGFloat) -> Void{
        setLineSpacing(spacing: lineSpacing)
        adjustHeight()
    }
    
    func adjustHeight(lineSpacing : CGFloat, numberOfLines : Int) -> Void{
        setLineSpacing(spacing: lineSpacing)
        adjustHeight(numberOfLines: numberOfLines)
    }
    
    func adjustHeight() -> Void{
        self.frame.size.height = 0
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.sizeToFit()
    }
    
    func adjustHeight(numberOfLines : Int) -> Void{
        self.frame.size.height = 0
        self.numberOfLines = numberOfLines
        self.lineBreakMode = NSLineBreakMode.byTruncatingTail
        self.sizeToFit()
    }
    
    func setLineSpacing(spacing : CGFloat) -> Void{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        let attrString = NSMutableAttributedString(string: self.text!)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:style, range:NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
    
}
