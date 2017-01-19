//
//  JS_Window.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/18.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation



class JSWindow{
    
    var name:String = "window"
    
    func defaultStatus(str: String) -> String {
            return name + JS.dotAdd(str: "defaultStatus") + EQUAL + SINGLE_QUO + str + SINGLE_QUO + JS_CMD_END
    }
    
    func confirm(str: String) -> String {
        return name + JS.dotAdd(str: "confirm") + JS.inParentheses(str: str) + JS_CMD_END
    }
}
