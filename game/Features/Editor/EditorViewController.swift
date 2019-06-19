//
//  EditorViewController.swift
//  game
//
//  Created by Eric on 2019/6/9.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
<<<<<<< HEAD
import RichEditorView
import Popover
=======
>>>>>>> aef8c4a6194c15d0faf87a336133c2b7882b6232

class EditorViewController: ToolBarViewController {
    
    var editor: RichEditorView!
    
    var editorBar: UIView!
    
    var btnFont: UIButton!
    
    var fontMenu: EditorFontMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        initEditorBar()
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
    
    func initViews(){
        editor = RichEditorView(frame: CGRect(x: PADDING_DEFAULT, y: PADDING_DEFAULT, width: ScreenWidth - PADDING_DEFAULT*2, height: ScreenHeight))
        editor.placeholder = "写点什么呢..."
        editor.backgroundColor = UIColor.gray
        addSubview(editor)
    }
    
    func initEditorBar(){
        editorBar = UIView()
        editorBar.frame = CGRect(x: 0, y: ScreenHeight - 56, width: ScreenWidth, height: 56)
        editorBar.backgroundColor = UIColor.gray
        editorBar.isHidden = true
        addSubview(editorBar)
        
        let btnClose = UIButton()
        btnClose.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
        btnClose.backgroundColor = UIColor.red
        btnClose.setTitle("-", for: .normal)
        btnClose.addTarget(self, action: #selector(EditorViewController.closeEditorBar), for: .touchUpInside)
        editorBar.addSubview(btnClose)
        
        btnFont = UIButton()
        btnFont.frame = CGRect(x: 56, y: 0, width: 56, height: 56)
        btnFont.backgroundColor = UIColor.gray
        btnFont.addTarget(self, action: #selector(EditorViewController.showFontMenu), for: .touchUpInside)
        btnFont.setTitle("A", for: .normal)
        editorBar.addSubview(btnFont)
        
        fontMenu = EditorFontMenu()
        fontMenu.attach(editorView: editor, fromView: btnFont)
    }

    @objc func closeEditorBar(){
        editor.endEditing(true)
    }
    
<<<<<<< HEAD
    @objc func showFontMenu(){
        fontMenu.show()
=======
    @objc func editFont(){
        print("editFont")
//        editor.bold()
//        editor.header(1)
>>>>>>> aef8c4a6194c15d0faf87a336133c2b7882b6232
    }
    
    @objc fileprivate func frameChange(_ notification:Notification){
        let info = notification.userInfo
        let keyboardRect = (info?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let options = UIView.AnimationOptions.curveEaseIn
        if(notification.name == UIResponder.keyboardWillShowNotification){
            self.editorBar.isHidden = false
            UIView.animate(withDuration: 0.25, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.editorBar.frame.origin.y = view.frame.height - (keyboardRect.height + self.editorBar.frame.height)
                }
            }, completion: nil)
        }
        else if(notification.name == UIResponder.keyboardWillHideNotification){
            self.editorBar.isHidden = true
            UIView.animate(withDuration:  0.25, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.editorBar.frame.origin.y = view.frame.height
                }
            }, completion: nil)
        }
    }
}
