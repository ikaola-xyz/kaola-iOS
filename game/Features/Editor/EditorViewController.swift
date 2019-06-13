//
//  EditorViewController.swift
//  game
//
//  Created by Eric on 2019/6/9.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import Aztec

class EditorViewController: ToolBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
//        let textView = Aztec.TextView(
//            defaultFont: UIFont.systemFont(ofSize: 12),
//            defaultParagraphStyle: ParagraphStyle.default,
//            defaultMissingImage: nil)
        
        let textView = Aztec.TextView(defaultFont: UIFont.systemFont(ofSize: 12), defaultMissingImage: UIImage(named: "AppIcon")!)
        textView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        addSubview(textView)
    }
}
