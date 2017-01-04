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
        setName(name: "ol")
    }
    
}


// unorder list
class UL : ListCore {
    
    override func initList() {
        setName(name: "ul")
    }
    
    
}

// define list

class  DL : ListCore {
    var dList: [(dt:String, dd:String)] = []
   
    
    override func initList() {
        setName(name: "dl")
    
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
        makeTag()
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
        setName(name: "dt")
    }
}

// <dd> xxx </dd>
class DD : JWSingle {
    
    override func initilizer () {
        setName(name: "dd")
    }
}

