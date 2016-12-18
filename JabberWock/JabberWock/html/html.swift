//
//  html.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation


class HTML:JW {
    var lang            : LANG!
    
    override init() {
        super.init()
        
        lang = LANG.en
        self.openString     =  "<html" + SPC + INSERTSTRING + ">"
        self.closeString    = "</html>"
    }
    
    private func insertLang () {
        // html tagでlangを設定しない場合
        if lang.str() == "" {
            openString = "<html>"
            return
        }
        
        openString = openString.replacingOccurrences(of: INSERTSTRING, with: self.lang.str())

    }
    
    override func assemble() {
        insertLang()
        childString.append(RET)
        assembleCore(isSingleLine: false)
    }
    
    
    
}
