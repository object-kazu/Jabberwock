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
        return name.dott(nex: "defaultStatus") + EQUAL.inSingleQuo(inn: str) + JS_CMD_END
 
    }
    
    func confirm(str: String) -> String {
        return name.dott(nex: "confirm").inParenth(inn: str) + JS_CMD_END

    }
}
