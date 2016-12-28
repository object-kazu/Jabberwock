//
//  meta.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/15.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

//<meta charset="UTF-8"/>

class META:JW {
    var charset : CHARSET = CHARSET.utf8
    
    override init() {
        super.init()
        
        self.openString = "<meta" + SPC + INSERTSTRING + "\"/>"
        self.closeString = NO_CLOSETAG
    }
    
    
    
    private func insertCharset () {
        // html tagでlangを設定しない場合
        openString = openString.replacingOccurrences(of: INSERTSTRING, with: self.charset.str())

    }
    
    override func assemble() {
        insertCharset()
        assemble()
    }

}

