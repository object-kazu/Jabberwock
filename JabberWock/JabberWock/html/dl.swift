//
//  dl.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/23.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

// define list

class  DL : ListCore {
    
    override func initilizer () {
        self.openString = "<dl>"
        self.closeString = "</dl>"
    }
    
    override func assemble() {
        addChild(child: dList(contents: contents))
        assemble()
    }

}



class  dList: List {
    
    private func makeListItem () {
        
        childString.append(contentsOf: contents)
        
        for s in childString {
            let i = DLItem(content: s)
            self.addMember(member: i)
        }
    }
    
    override func assemble() {
        makeListItem()
    }
}

// <dt> xxx </dt>
class DLItem : ListItem {

    override func initilizer () {
        self.openString = "<dt>"
        self.closeString = "</dt>"
    }
    
    
}
