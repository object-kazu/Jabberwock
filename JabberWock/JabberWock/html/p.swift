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
    
    private func makeSentence () {
        
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

    var content :  String  = ""

    override init() {
        super.init()
        
        self.openString = "<p>"
        self.closeString = "</p>"
    }
    
    private func insertContent () {
        childString.append(content)
    }
    
    override func assemble() {
        insertContent()
        assembleCore(isSingleLine: true)
    }
}
