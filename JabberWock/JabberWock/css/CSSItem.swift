//
//  CSSItem.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/05.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation


class CSSItem {
    
    var name: String!
    var value: String  = ""
    
    init() {
        initialize()
    }
    
    init(value: String) {
        initialize()
        self.value = value
    }
    
    func initialize()  {}
    
    func cssItemStr () -> String {
        if value.isEmpty {
            return ""
        }
        
        //exp)  background: #ffffff;
        return name + COLON + SPC + value + SEMI_COLON + RET
    }
    
}

//class csColor: CSSItem {
//    override func initialize()  {
//        self.name = "color"
//    }
//}
//class csOpacity: CSSItem {
//    override func initialize() {
//        self.name = "opacity"
//    }
//}
