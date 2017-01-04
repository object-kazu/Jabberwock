//
//  heading.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/15.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class HEADING : JWSingle {
    // h1 ~ h6
    var level:      Int     = 1
    private var name = "h"
    
    override init() {
        super.init()
        
    }

    init(level: Int, content: String) {
        super.init()
        self.content = content
        self.level = level
        
    }
    
    private func initialize () {
        insertLevel()
        setName(name: self.name)
        
    }

    
    private func insertLevel () {
        if level < 1 {
            level = 1
        }
        
        if level > 6 {
            level = 6
        }
        name = "h" + "\(level)"
        
    }
    
    
    override func assemble() {
        initialize()
        makeTag()
        makeResult()
    }

    
    
}
