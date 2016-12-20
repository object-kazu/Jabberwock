//
//  bistrong.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/20.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class B : JW {
    
    var content :  String  = ""

    
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

    private func insertContent () {
        childString.append(content)
    }

    override func assemble() {
        insertContent()
        assembleCore(isSingleLine: true)
    }

}

class I : JW {
    var content :  String  = ""

    
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

    
    private func insertContent () {
        childString.append(content)
    }

    override func assemble() {
        insertContent()
        assembleCore(isSingleLine: true)
    }
    
}

class STRONG : JW {
    var content :  String  = ""
    
    
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


    private func insertContent () {
        childString.append(content)
    }

    
    override func assemble() {
        insertContent()
        assembleCore(isSingleLine: true)
    }
    
}
