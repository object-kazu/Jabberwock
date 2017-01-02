//
//  list.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/23.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation


class ListCore : JWMulti {
    var contents :  [String]  = []
    
    override init() {
        super.init()
        initList()
    }
    
    init(contents: [String]) {
        super.init()
        initList()
        self.contents = contents
        
    }
    
    func initList () {
        openString  = "<>"
        closeString = "<>"
    }

    func makeListItem () {
        for s in contents {
            let i = ListItem(content: s)
            self.addChild(child: i)
        }
    }

    
    override func assemble() {
        makeListItem()
        makeResult()
    }
}


/*
 <li> xxx
 <li> xxx
 <li> xxx
 */

class  List: JWSingle {
    
    var contents :  [String]  = []
    
    override init() {
        super.init()
        initialize()
    }
    
    
    init(contents: [String]) {
        super.init()
        initialize()
        self.contents = contents
        
    }
    
    func initialize()  {}
    
    func makeListItem () {
        var t : [String] = []
        if content != "" {
            t.append(content)
        }
        t.append(contentsOf: contents)

        for s in t {
            let i = ListItem(content: s)
            self.addMember(member: i)
        }
    }
    
    override func assemble() {
        makeListItem()
    }
}

// <li> xxx
class ListItem : JWSingle {

    override func initilizer () {
        self.openString = "<li>"
        self.closeString = ""
    }

}
