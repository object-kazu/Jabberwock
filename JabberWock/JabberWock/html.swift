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
    var charset         : CHARSET!
    var openString      : String = "<html>"
    var closeString     : String = "</html>"
    
    override init() {
        lang = LANG.en
        charset = CHARSET.utf8
    }
    
    func assemble() {
        resultString += openString
        resultString += RET
        resultString += closeString
    }
    
    
    
}
