//
//  JWInsertContent.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/31.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class JWInsertContent : JW {
    
    
    override init() {
        super.init()
        initilizer()
        self.isMultiLine = false
        
    }
    
    init(content: String) {
        super.init()
        self.initilizer()
        self.isMultiLine = false
        self.content = content
        
    }
    
    func initilizer () {
        self.openString = ""
        self.closeString = ""
    }
    
    
    override func assemble() {
        assembleWithContent()
    }
}
