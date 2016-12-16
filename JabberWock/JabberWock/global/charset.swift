//
//  charset.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

enum CHARSET: String {
    case utf8


    func str() -> String {
        let charStrOpen = "charset=" + "\""
        let charStrClose = "\""

        func charsetStr (char: String) -> String {
            return charStrOpen + char + charStrClose
        }
        
        switch self {
        case .utf8:
            return charsetStr(char: "UTF-8")
        default:
            return charsetStr(char: "UTF-8")
        }
    }
    
    
}
