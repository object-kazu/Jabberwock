//
//  bistrong.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/20.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation


class B : JWInsertContent {

    override func initilizer () {
        self.openString = "<b>"
        self.closeString = "</b>"
    }

}

class I : JW {
  
    
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
        self.openString = "<i>"
        self.closeString = "</i>"
        self.isMultiLine = false
    }

    
   
    override func assemble() {
        assembleWithContent()
    }

   
}

class STRONG : JW {
   
    
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
        self.openString = "<strong>"
        self.closeString = "</strong>"
        self.isMultiLine = false
    }


 
    
    override func assemble() {
        assembleWithContent()
    }
    
}

class BR : JW {
 
    
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
        self.openString = ""
        self.closeString = "<br>"
        self.isMultiLine = false
    }
    
    
    
    override func assemble() {
        assembleWithContent()
    }
    
}




