//
//  EditorViewController.swift
//  game
//
//  Created by Eric on 2019/6/9.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import RichEditorView

class EditorViewController: ToolBarViewController {
    
    var editorBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        let editor = RichEditorView(frame: CGRect(x: PADDING_DEFAULT, y: PADDING_DEFAULT, width: ScreenWidth - PADDING_DEFAULT*2, height: ScreenHeight))
        self.view.addSubview(editor)
        
        editorBar = UIView()
        editorBar.frame = CGRect(x: 0, y: ScreenHeight - 56, width: ScreenWidth, height: 56)
        editorBar.backgroundColor = UIColor.gray
        addSubview(editorBar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.frameChange(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.frameChange(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    @objc fileprivate func frameChange(_ notification:Notification){
        let info = notification.userInfo
        let keyboardRect = (info?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let options = UIView.AnimationOptions.curveEaseIn
        if(notification.name == UIResponder.keyboardWillShowNotification){
            print("frameChange show")
            UIView.animate(withDuration: 0.25, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.editorBar.frame.origin.y = view.frame.height - (keyboardRect.height + self.editorBar.frame.height)
                }
            }, completion: nil)
        }
        else if(notification.name == UIResponder.keyboardWillHideNotification){
            print("frameChange hide")
            UIView.animate(withDuration:  0.25, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.editorBar.frame.origin.y = view.frame.height
                }
            }, completion: nil)
        }
    }
}
