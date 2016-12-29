//
//  blockquote.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/22.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class BACKQUOTE : JW {
    
    
    
    override init() {
        super.init()
        initilizer()
        
    }
    
    init(content: String) {
        super.init()
        self.initilizer()
        self.content = content
        
    }
    
    private func initilizer () {
        self.openString = "<blockquote>"
        self.closeString = "</blockquote>"
    }
    
    
    override func assemble() {
        insertContent()
        assemble()
    }
}
