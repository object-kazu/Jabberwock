//
//  p.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/18.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class P: JW {

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
    
    private func initialize () {
        self.isMultiLine = false
        
    }
    
    private func makeSentence () {
        if content != "" {
            childString.append(content)
        }
        
        childString.append(contentsOf: contents)
        
        for s in childString {
            let p = Pp()
            p.content = s
            self.addMember(member: p)
        }
    }
    
    override func assemble() {
        makeSentence()
    }
}

private class Pp: JW {

    override init() {
        super.init()
        initialize()
        
    }
    
    private func initialize () {
        self.openString = "<p>"
        self.closeString = "</p>"
        self.isMultiLine = false
        
    }

    override func assemble() {
        assembleWithContent()
    }
}
