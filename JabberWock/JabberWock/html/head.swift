//
//  head.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class HEAD:JWMulti {
    
    override init() {
        super.init()
        setName(name: "head")
    }
    
    // title
    func setTitle (of:String) {
        let t = TITLE()
        t.setTile(content: of)
        setTitle(of: t)
        
    }
    
    func setTitle (of:JWObject){
        addChild(child: of)
    }
    
    // charset
    func setCharset (of: CHARSET) {
        let c = META()
        c.setCharset(of: of)
        addChild(child: c)
    }
    
    override func assemble() {
        makeTag()
        makeResult()
    }

    
}



