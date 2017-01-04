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
    
    func initList () {}

    func makeListItem () {
        for s in contents {
            let i = ListItem(content: s)
            self.addChild(child: i)
        }
    }

    
    override func assemble() {
        makeTag()
        makeListItem()
        makeResult()
    }
}



// <li> xxx
class ListItem : JWSingle {

    override func initilizer () {
        setName(name: "li")
        isSingleTag(single: true)
    }

}
