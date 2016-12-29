//
//  head.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class HEAD:JW {
    
    override init() {
        super.init()
        self.openString = "<head>"
        self.closeString = "</head>"
        self.isMultiLine = true
    }
    
    // title
    func setTitle (title:String) {
        let t = TITLE()
        t.setTile(content: title)
        setTitle(title: t)
        
    }
    
    func setTitle (title:JW){
        addChild(child: title)
    }
    
    // charset
    func setCharset (char: CHARSET) {
        let c = META()
        c.charset = CHARSET.utf8
        addChild(child: c)
    }
    
}



