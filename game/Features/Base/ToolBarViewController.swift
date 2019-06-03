//
//  ToolBarViewController.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

class ToolBarViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        if(displayBack()){
//            setLeftItem("ic_action_back", action: #selector(finish(_:)))
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayBack() -> Bool{
        return true
    }
}
