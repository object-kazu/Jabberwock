//
//  blockquote.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/22.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class BLOCKQUOTE : JWInsertContent {
    
    override func initilizer () {
        self.openString = "<blockquote>"
        self.closeString = "</blockquote>"
    }
    
}
