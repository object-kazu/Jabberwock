//
//  title.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/14.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class TITLE: JW {
    private var title : String = ""
    
    override init() {
        super.init()
        initilizer()
    }
    
    init(title: String) {
        super.init()
        self.initilizer()
        setTile(title: title)
        
    }
    
    private func initilizer () {
        self.openString = "<title>"
        self.closeString = "</title>"
    }

    
    func setTile(title: String) {
        addMember(member: title)
    }
    

}
