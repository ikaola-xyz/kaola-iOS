//
//  EditorFontMenu.swift
//  game
//
//  Created by Eric on 18/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit
import Popover

class EditorFontMenu {
    
    let height: CGFloat = 40
    
    var popover: Popover!
    
    var fromView: UIView!
    
    var contentView: UIView!
    
    var editorView: RichEditorView!
    
    var bntBlockquote: UIButton!
    
    func attach(editorView: RichEditorView ,fromView: UIView){
        self.editorView = editorView
        self.fromView = fromView
        let options: [PopoverOption] = [.type(.up), .showBlackOverlay(false)]
        popover = Popover(options: options)
        popover.popoverColor = UIColor.gray
    }
    
    func createContentView(){
        contentView = UIView(frame: CGRect(x: PADDING_DEFAULT, y: 0, width: ScreenWidth - PADDING_DEFAULT*2, height: height))
        
        let btnBold = UIButton()
        btnBold.frame = CGRect(x: 0, y: 0, width: 50, height: height)
        btnBold.setTitle("B", for: .normal)
        btnBold.addTarget(self, action: #selector(self.bold), for: .touchUpInside)
        contentView.addSubview(btnBold)
        
        let btnItalic = UIButton()
        btnItalic.frame = CGRect(x: 50, y: 0, width: 50, height: height)
        btnItalic.setTitle("I", for: .normal)
        btnItalic.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btnItalic.titleLabel?.font = UIFont.italicSystemFont(ofSize: 16)
        btnItalic.addTarget(self, action: #selector(self.italic), for: .touchUpInside)
        contentView.addSubview(btnItalic)
        
        bntBlockquote = UIButton()
        bntBlockquote.frame = CGRect(x: 100, y: 0, width: 50, height: height)
        bntBlockquote.setTitle("Q", for: .normal)
        bntBlockquote.addTarget(self, action: #selector(self.blockquote), for: .touchUpInside)
        contentView.addSubview(bntBlockquote)
        
        let btnHeader1 = UIButton()
        btnHeader1.frame = CGRect(x: 150, y: 0, width: 50, height: height)
        btnHeader1.setTitle("H1", for: .normal)
        btnHeader1.addTarget(self, action: #selector(self.header1), for: .touchUpInside)
        contentView.addSubview(btnHeader1)
    }
    
    func show(){
        createContentView()
        popover.show(contentView, fromView: fromView)
    }
    
    func dismiss(){
        popover.dismiss()
    }
    
    @objc func bold(){
        editorView.bold()
    }
    
    @objc func italic(){
        editorView.italic()
    }
    
    var hasBlockquoted = false
    
    @objc func blockquote(){
        if(!hasBlockquoted){
            bntBlockquote.setTitleColor(UIColor.green, for: .normal)
            hasBlockquoted = true
            editorView.blockquote()
        }else{
            bntBlockquote.setTitleColor(UIColor.white, for: .normal)
            hasBlockquoted = false
            editorView.div()
        }
    }
    
    @objc func header1(){
        editorView.header(1)
    }
    
    @objc func header2(){
        editorView.header(2)
    }
    
    @objc func header3(){
        editorView.header(3)
    }
}
