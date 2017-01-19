//
//  JS_Document.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/16.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation

class JSDocument{
    
    private let name:String = "document"
    
    func write(str: String) -> String {
        return name + JS.dotAdd(str: "write") + JS.inParentheses(str: str) + JS_CMD_END
    }
}
