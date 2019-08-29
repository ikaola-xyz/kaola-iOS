//
//  EditorViewController.swift
//  game
//
//  Created by Eric on 2019/6/9.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import Popover

class EditorViewController: ToolBarViewController {
    
    var tfTitle: UITextField!
    
    var editor: RichEditorView!
    
    var editorBar: UIView!
    
    var btnFont: UIButton!
    
    var fontMenu: EditorFontMenu!
    
    var editorPresenter: EditorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editorPresenter = EditorPresenter()
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
        tfTitle = UITextField()
        tfTitle.frame = CGRect(x: PADDING_DEFAULT, y: NavgationBarHeight, width: ScreenWidth - PADDING_DEFAULT*2, height: 56)
        tfTitle.font = UIFont.boldSystemFont(ofSize: 18)
        tfTitle.backgroundColor = UIColor.white
        tfTitle.textColor = UIColor.grayDark()
        tfTitle.placeholder = "请输入标题..."
        addSubview(tfTitle)
        
        let divider = UIImageView()
        divider.frame = CGRect(x: PADDING_DEFAULT, y: tfTitle.frame.maxY, width: tfTitle.getWidth(), height: 1)
        divider.backgroundColor = UIColor.border()
        addSubview(divider)
        
        let editorHeight: CGFloat = ScreenHeight - NavgationBarHeight - 10 - tfTitle.getHeight()
        editor = RichEditorView(frame: CGRect(x: PADDING_DEFAULT, y: tfTitle.frame.maxY + PADDING_DEFAULT, width: ScreenWidth - PADDING_DEFAULT*2, height: editorHeight))
        editor.placeholder = "写点什么呢..."
        addSubview(editor)
        
        self.setRightItem(title: "发布", action: #selector(publish))
    }
    
    @objc func publish(){
        editorPresenter.publish(title: tfTitle.text!, content: editor.contentHTML) { isSuccess in
            self.finish()
        }
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
        tfTitle.endEditing(true)
    }
    
    @objc func showFontMenu(){
        fontMenu.show()
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
            fontMenu.dismiss()
            self.editorBar.isHidden = true
            UIView.animate(withDuration:  0.25, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.editorBar.frame.origin.y = view.frame.height
                }
            }, completion: nil)
        }
    }
}
