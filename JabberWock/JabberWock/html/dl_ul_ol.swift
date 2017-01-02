//
//  dl.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/23.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation


// order list
class OL : ListCore {
    
    override func initList() {
        self.openString = "<ol>"
        self.closeString = "</ol>"
    }
    
}


// unorder list
class UL : ListCore {
    
    override func initList() {
        self.openString = "<ul>"
        self.closeString = "</ul>"
    }
    
    
}

// define list

class  DL : ListCore {
    var dList: [(dt:String, dd:String)] = []
   
    
    override func initList() {
        self.openString = "<dl>"
        self.closeString = "</dl>"
    
    }
    
    override func makeListItem () {
        for taple: (dt:String, dd:String) in dList {
            let tdt = DT(content: taple.dt)
            let tdd = DD(content: taple.dd)
            self.addChild(child: tdt)
            self.addChild(child: tdd)
        }
    }
    
    
    override func assemble() {
        makeListItem()
        makeResult()
    }

    
    
}


// dt, dd set
// <dt> xxx </dt>
// <dd> xxx </dd>



// <dt> xxx </dt>
class DT : JWSingle {

    override func initilizer () {
        self.openString = "<dt>"
        self.closeString = "</dt>"
    }
}

// <dd> xxx </dd>
class DD : JWSingle {
    
    override func initilizer () {
        self.openString = "<dd>"
        self.closeString = "</dd>"
    }
}

