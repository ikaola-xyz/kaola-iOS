//
//  UITableView+Extension.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView{
    
    func registerNib(_ nibName : String){
        register(UINib(nibName: nibName, bundle:nil), forCellReuseIdentifier: nibName);
    }
    
    func register(_ cellClass: AnyClass?, identifier: String){
        register(cellClass, forCellReuseIdentifier: identifier)
    }
}
