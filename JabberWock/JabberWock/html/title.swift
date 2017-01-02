//
//  title.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/14.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class TITLE: JWSingle {
   
    override init() {
        super.init()
        initilizer()
    }
    
    override init(content: String) {
        super.init()
        self.initilizer()
        setTile(content : content)
    }
    
    override func initilizer () {
        self.openString = "<title>"
        self.closeString = "</title>"
    }

    
    func setTile(content : String) {
        self.content = content
    }
    

}
