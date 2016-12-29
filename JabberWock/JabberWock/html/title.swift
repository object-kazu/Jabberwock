//
//  title.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/14.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class TITLE: JW {
   
    override init() {
        super.init()
        initilizer()
    }
    
    init(content: String) {
        super.init()
        self.initilizer()
        setTile(content : content)
    }
    
    private func initilizer () {
        self.isMultiLine = false
        self.openString = "<title>"
        self.closeString = "</title>"
    }

    
    func setTile(content : String) {
        self.content = content
        self.insertContent()
    }
    

}
