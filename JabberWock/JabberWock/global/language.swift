//
//  language.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

enum LANG :String{
    case en
    case ja
    
    func str() -> String {
        let charStrOpen = "lang=" + "\""
        let charStrClose = "\""
        
        func charsetStr (char: String) -> String {
            return charStrOpen + char + charStrClose
        }
        
        switch self {
        case .en:
            return charsetStr(char: "en")
        case .ja:
            return charsetStr(char: "ja")
        }
    }
    
}
