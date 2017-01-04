//
//  meta.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/15.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

//<meta charset="UTF-8"/>

/*
 meta tagは今後複雑になる可能性があるので、
 TagStringクラスを使用しない仕様にしてある。
 
 */

class META:JWSingle {
    private var charset : CHARSET = CHARSET.utf8
    
    override init() {
        super.init()
        self.openString     = "<meta" + SPC + INSERTSTRING + "/>"
        self.closeString    = ""

    }
    
    func setCharset(of: CHARSET)  {
        self.charset = of
    }
    
    func insertCharset () {
        openString = openString.replacingOccurrences(of: INSERTSTRING, with: self.charset.str())
    }
    
    override func makeTag() {}
    
    override func assemble() {
        insertCharset()
        makeResult()
    }
    
}

