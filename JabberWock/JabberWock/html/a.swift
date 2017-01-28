//
//  a.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/21.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation
class A : JWSingle {
    
    override init() {
        super.init()
    }
    
    init(href:String){
        super.init()
        initilizer()
        self.href(_href: href)
        self.target(_target: "")
    }
    
    init (href:String, target:String) {
        super.init()
        initilizer()
        self.href(_href: href)
        self.target(_target: target)
        
    }

    func href(_href : String) {
        if _href.isEmpty {return}
        tagManager.attr.add(href: _href)
    }
    
    func target(_target:String)  {
        if _target.isEmpty {return}
        tagManager.attr.add(target: _target)
    }
    
    override func initilizer () {
        setName(name: "a")
    }
    
}
