//
//  html.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

let INSERTSTRING: String    = "%%"
let INSERT_LANG: String = "lang = " + INSERTSTRING

class HTML:JW {
    var lang            : LANG!
    var charset         : CHARSET!
    
    override init() {
        super.init()
        
        lang = LANG.en
        charset = CHARSET.utf8
        self.openString =  "<html" + SPC + INSERT_LANG + SPC + ">"
        self.closeString = "</html>"
    }
    
    private func insertLang () {
        // html tagでlangを設定しない場合
        if lang.str() == "" {
            openString = "<html>"
            return
        }
        
        let str = "\"" + lang.str() + "\""
        openString = openString.replacingOccurrences(of: INSERTSTRING, with: str)
    }
    
    override func assemble() {
        insertLang()
        assembleCore()
    }
    
    
    
}
