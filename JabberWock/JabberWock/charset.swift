//
//  charset.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

enum CHARSET {
    case utf8
    
    func str() -> String {
        switch self {
        case .utf8:
            return "UTF-8"
        default:
            return "UTF-8"
        }
    }
}
