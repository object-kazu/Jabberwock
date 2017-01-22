//
//  image.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/22.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation

class IMAGE:JWSingle {
    
    //<img src="image/sample.gif" alt="イラスト２" width=100 height=100>
    
    var src : String    = ""
    var alt : String    = ""
    var width: String   = ""
    var height :String  = ""
    
    init(src:String, alt:String, width: String, height:String) {
        super.init()
        initilizer()
        self.src = src
        self.alt = alt
        self.width = width
        self.height = height
        
        
        self.tagManager.openString(spec: SPC + INSERTSTRING)
        self.tagManager.closeString(spec: NOT_REQUIRE)
        
        
    }
  
    override func initilizer() {
        setName(name: "img")
    }
    
    
    func insertSrc () {
        
        var  target = ""
        
        if !src.isEmpty {
            target += "src=" + DOUBLE_QUO + src + DOUBLE_QUO + SPC
        }
        
        if !alt.isEmpty {
            target += "alt=" + DOUBLE_QUO + alt + DOUBLE_QUO + SPC
        }
        if !width.isEmpty {
            target += "width=" + DOUBLE_QUO + width + DOUBLE_QUO + SPC
        }
        
        if !height.isEmpty {
            target += "height=" + DOUBLE_QUO + height + DOUBLE_QUO
        }
        

        self.tagManager.openStringReplace(of: INSERTSTRING, with: target)
    }
    
    override func assemble() {
        insertSrc()
        makeResult()
    }
    
}
