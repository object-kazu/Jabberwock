//
//  head.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class HEADER:JW {
    
    override init() {
        super.init()
        self.openString = "<head>"
        self.closeString = "</head>"
    }
    
    // title
    func setTitle (title:String) {
        let t = TITLE()
        t.setTile(title: title)
        setTitle(title: t)
        
    }
    
    func setTitle (title:JW){
        addChild(child: title)
    }
    
    override func assemble() {
        assembleCore()
    }
    
}


class META:JW {
    var charset = CHARSET.utf8
}

