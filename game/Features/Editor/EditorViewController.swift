//
//  EditorViewController.swift
//  game
//
//  Created by Eric on 2019/6/9.
//  Copyright © 2019 Eric. All rights reserved.
//

import UIKit
import Popover
import Toast_Swift
import Qiniu

class EditorViewController: ToolBarViewController, ImagePickerDelegate {
    
    var tfTitle: UITextField!
    
    var editor: RichEditorView!
    
    var editorBar: UIView!
    
    var btnFont: UIButton!
    
    var fontMenu: EditorFontMenu!
    
    var editorPresenter: EditorPresenter!
    
    var imagePicker: ImagePicker!
    
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
        self.view.makeToastActivity(.center)
        editorPresenter.publish(title: tfTitle.text!, content: editor.contentHTML) { statusCode in
            self.view.hideToastActivity()
            if(statusCode == 200){
                self.finish()
            }else{
                self.view.makeToast("发布失败")
                self.push(viewController: LoginViewController())
            }
        }
    }
    
    func initEditorBar(){
        editorBar = UIView()
        editorBar.frame = CGRect(x: 0, y: ScreenHeight - 56, width: ScreenWidth, height: 56)
        editorBar.backgroundColor = UIColor.border()
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
        btnFont.addTarget(self, action: #selector(EditorViewController.showFontMenu), for: .touchUpInside)
        btnFont.setTitle("Font", for: .normal)
        editorBar.addSubview(btnFont)
        
        let btnPicture = UIButton()
        btnPicture.frame = CGRect(x: 56 * 2, y: 0, width: 56, height: 56)
        btnPicture.setTitle("PIC", for: .normal)
        btnPicture.addTarget(self, action: #selector(EditorViewController.addPicture), for: .touchUpInside)
        editorBar.addSubview(btnPicture)
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        let btnUndo = UIButton()
        btnUndo.frame = CGRect(x: 56 * 3, y: 0, width: 56, height: 56)
        btnUndo.setTitle("<-", for: .normal)
        btnUndo.addTarget(self, action: #selector(EditorViewController.undo), for: .touchUpInside)
        editorBar.addSubview(btnUndo)
        
        let btnRedo = UIButton()
        btnRedo.frame = CGRect(x: 56 * 4, y: 0, width: 56, height: 56)
        btnRedo.setTitle("->", for: .normal)
        btnRedo.addTarget(self, action: #selector(EditorViewController.redo), for: .touchUpInside)
        editorBar.addSubview(btnRedo)
        
        fontMenu = EditorFontMenu()
        fontMenu.attach(editorView: editor, fromView: btnFont)
    }
    
    @objc func closeEditorBar(){
        editor.endEditing(true)
        tfTitle.endEditing(true)
        hideEditorBar()
    }
    
    @objc func showFontMenu(){
        fontMenu.show()
    }
    
    @objc fileprivate func frameChange(_ notification:Notification){
        let info = notification.userInfo
        let keyboardRect = (info?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let options = UIView.AnimationOptions.curveEaseIn
        if(notification.name == UIResponder.keyboardWillShowNotification){
            if(self.editorBar.isHidden){
                self.editorBar.isHidden = false
                UIView.animate(withDuration: 0.25, delay: 0, options: options, animations: {
                    if let view = self.view {
                        self.editorBar.frame.origin.y = view.frame.height - (keyboardRect.height + self.editorBar.frame.height)
                    }
                }, completion: nil)
            }
        }
    }
    
    func hideEditorBar(){
        if(!self.editorBar.isHidden){
            fontMenu.dismiss()
            self.editorBar.isHidden = true
            let options = UIView.AnimationOptions.curveEaseIn
            UIView.animate(withDuration:  0.25, delay: 0, options: options, animations: {
                if let view = self.view {
                    self.editorBar.frame.origin.y = view.frame.height
                }
            }, completion: nil)
        }
    }
    
    @objc func addPicture(){
        print("add picture")
        self.imagePicker.present(from: btnFont)
    }
    
    func didSelect(image: UIImage?) {
        self.view.makeToastActivity(.center)
        QiniuHelper.uploadImage(image: image!) { (hash) in
            self.view.hideToastActivity()
            if(hash.isEmpty){
                self.view.makeToast("上传失败")
            }else{
                self.editor.insertImage("http://img.ikaola.xyz/"+hash, alt: hash)
                print(hash)
            }
        }
    }
    
    func upload(){
        
    }
    
    @objc func undo(){
        print("undo")
        self.editor.undo()
    }
    
    @objc func redo(){
        print("redo")
        self.editor.redo()
    }
}
