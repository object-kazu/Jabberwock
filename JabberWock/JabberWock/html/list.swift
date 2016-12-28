//
//  list.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/23.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

// order list
class OL : ListCore {
    
    override func initilizer () {
        self.openString = "<ol>"
        self.closeString = "</ol>"
    }
    
}


// unorder list
class UL : ListCore {
    
    override func initilizer () {
        self.openString = "<ul>"
        self.closeString = "</ul>"
    }
    
    
}

class ListCore : JW {
    var contents :  [String]  = []
    
    override init() {
        super.init()
        initilizer()
    }
    
    init(contents: [String]) {
        super.init()
        self.initilizer()
        self.contents = contents
        
    }
    
    func initilizer () {
        openString = "<>"
        closeString = "<>"
    }

    
    override func assemble() {
        addChild(child: List(contents: contents))
        assemble()
    }
}


/*
 <li> xxx
 <li> xxx
 <li> xxx
 */

class  List: JW {
    
    var contents :  [String]  = []
    
    override init() {
        super.init()
    }
    
    
    init(contents: [String]) {
        super.init()
        self.contents = contents
        
    }
    
    private func makeListItem () {
        
        childString.append(contentsOf: contents)
        
        for s in childString {
            let i = ListItem(content: s)
            self.addMember(member: i)
        }
    }
    
    override func assemble() {
        makeListItem()
        
    }

    
}

// <li> xxx
class ListItem : JW {
    var content : String = ""
    
    override init() {
        super.init()
        self.initilizer()
    }
    
    init(content: String) {
        super.init()
        self.initilizer()
        self.content = content
        
    }
    
    func initilizer () {
        self.openString = "<li>"
        self.closeString = ""
    }

    private func insertContent () {
        childString.append(content)
    }

    override func assemble() {
        insertContent()
        assemble()
    }
    
}
