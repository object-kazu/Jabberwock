//
//  script.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/16.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation



class SCRIPT : JWMulti {
    
    var fileName: String = ""
    
    override init() {
        super.init()
        
    }
    
    init(type: String, name:String, path:String) {
        super.init()
        self.initialize()
        self.tagManager.jsFileName = name
        self.tagManager.jsPath = path
        self.tagManager.jsType = type
        
    }
    
    init(type:String) {
        super.init()
        self.initialize()
        self.tagManager.jsType = type
    }
    
    init(name:String){
        super.init()
        self.initialize()
        self.tagManager.jsFileName = name
    }

    init(name:String, path: String){
        super.init()
        self.initialize()
        self.tagManager.jsFileName = name
        self.tagManager.jsPath = path
    }

    
    private func initialize () {
        setName(name:"script")
    }
    
    override func assemble() {
        initialize()
        makeTag()
        makeResult()
    }
    
    
    /// add child
    /*
        srcの指定有無によってaddChildの挙動を変更したいので、overrideする
     */
    override func addChild (child : JWObject){
        /// script tagはJWObjecをとらない
        assertionFailure("script tag do not have JWObject")
    }
    
    override  func addChildren (children : [JWObject]){
        /// script tagはJWObjecをとらない
        assertionFailure("script tag do not have JWObject")
    }
    
}
