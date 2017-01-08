//
//  CSS.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/05.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation


class CSS {
    
    
    var cssName : String!
    var cssResultString: String = ""

    
    // color
    var color       : csColor    = csColor()
    var opacity     : csOpacity  = csOpacity()

    
    // background
    var background  : CSSItem   = CSSItem()
    
    
    // init
    
    //todo init(id), init(class), init(by:tag)
    
    init(name:String) {
        self.cssName = name
    }
    init(id:String){
        self.cssName = "#" + id
    }
    init(cls:String) {
        self.cssName = "." + cls
    }
    
    func initUniverse () { // universe
        self.cssName = "*"
    }
    
    
    func Str() -> String  {
        
        cssResultString = "" // init
        
        /// nameがないものは出力しない
        if cssName.isEmpty {
            return ""
        }
        
        // 接頭句
        cssResultString += cssName + SPC + "{" + RET
        
        
        // color
        addCSS(css: color.cssItemStr())
        addCSS(css: opacity.cssItemStr())
        
        
        // background
        addCSS(css: background.cssItemStr())
        
        
        // 接尾句
        cssResultString += "}"
        return cssResultString
    }
    
    private func addCSS (css: String) {
        
        cssResultString += css
    }

}
