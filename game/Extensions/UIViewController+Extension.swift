//
//  UIViewController+Extension.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController{
    
    func setLeftItem(_ imageName: String?, action: Selector) {
        self.navigationItem.leftBarButtonItem = createButtonItem(imageName, action: action)
    }
    
    func setRightItem(_ imageName: String?, action: Selector) {
        self.navigationItem.rightBarButtonItem = createButtonItem(imageName, action: action)
    }
    
    func setRightItem(title: String?, action: Selector) {
        self.navigationItem.rightBarButtonItem = createButtonItem(title: title, action: action)
    }
    
    /**
     If want invoke this method, must invoke setRightItem() at first.
     - parameter imageName:
     - parameter action:
     */
    func appendRightItem(_ imageName: String?, action: Selector) {
        self.navigationItem.rightBarButtonItems?.append(createButtonItem(imageName, action: action))
    }
    
    func createButtonItem(_ imageName: String?, action: Selector) -> UIBarButtonItem {
        var image : UIImage = UIImage(named: imageName!)!
        image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        return UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: action)
    }
    
    func createButtonItem(title: String?, action: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(title: title, style: .plain, target: self, action: action)
    }
    
    func push(viewController: UIViewController){
        print("push viewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop(){
        self.navigationController?.popViewController(animated: true)
    }
}

