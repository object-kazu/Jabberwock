//
//  language.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation
enum LANG {
    case en
    case ja
    
    func str() -> String {
        switch self {
        case .en:
            return "en"
        case .ja:
            return "ja"
        default:
            return "ja"
        }
    }
    
}
