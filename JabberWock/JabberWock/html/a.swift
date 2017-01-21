//
//  a.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/21.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation
class A : JWSingle {
    
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
        self.tagManager.href = _href
    }
    
    func target(_target:String)  {
        self.tagManager.target = _target
    }
    
    override func initilizer () {
        setName(name: "a")
    }
    
}
