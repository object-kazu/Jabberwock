//
//  bistrong.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/20.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class B : JW {
    
    
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
        self.openString = "<b>"
        self.closeString = "</b>"
    }

   
    override func assemble() {
        insertContent()
        assemble()
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
    }

    
   
    override func assemble() {
        insertContent()
        assemble()
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
    }


 
    
    override func assemble() {
        insertContent()
        assemble()
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
    }
    
    
    
    override func assemble() {
        insertContent()
        assemble()
    }
    
}




