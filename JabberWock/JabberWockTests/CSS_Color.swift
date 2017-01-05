//
//  CSS_Color.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/05.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation

class csColor: CSSItem {
    override func initialize()  {
        self.name = "color"
    }
}
class csOpacity: CSSItem {
    override func initialize() {
        self.name = "opacity"
    }
}
