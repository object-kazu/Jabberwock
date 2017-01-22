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
        initilizer()
        self.tagManager.openString(spec: SPC + INSERTSTRING + "/")
        self.tagManager.closeString(spec: NOT_REQUIRE)

    }
    override func initilizer() {
        setName(name: "meta")
    }
    
    func setCharset(of: CHARSET)  {
        self.charset = of
    }
    
    func insertCharset () {
        self.tagManager.openStringReplace(of: INSERTSTRING, with: charset.str())
    }
    
    override func assemble() {
        insertCharset()
        makeResult()
    }
    
}

