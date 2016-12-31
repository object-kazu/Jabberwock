//
//  bistrong.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/20.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation


class B : JWInsertContent {

    override func initilizer () {
        self.openString = "<b>"
        self.closeString = "</b>"
    }

}

class I : JWInsertContent {
    
    override func initilizer () {
        self.openString = "<i>"
        self.closeString = "</i>"
    }
 
}

class STRONG : JWInsertContent {
   
    
    override func initilizer () {
        self.openString = "<strong>"
        self.closeString = "</strong>"
    }
    
}

class BR : JWInsertContent {
 
    
    override func initilizer () {
        self.openString = ""
        self.closeString = "<br>"
    }
    
}




