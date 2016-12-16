//
//  heading.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/15.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class HEADING : JW {
    // h1 ~ h6
    var headingLevel = 1

    override init() {
        super.init()
        
        self.openString = "<h" + INSERTSTRING + ">"
        self.closeString = "</h" + INSERTSTRING + ">"
        
    }
    
    private func insertLevel () {
        if headingLevel < 1 {
            headingLevel = 1
        }
        
        if headingLevel > 6 {
            headingLevel = 6
        }
        
        openString = openString.replacingOccurrences(of: INSERTSTRING, with: "\(self.headingLevel)")
        closeString = closeString.replacingOccurrences(of: INSERTSTRING, with: "\(self.headingLevel)")
        
    }
    
    override func assemble() {
        insertLevel()
  //      assembleCore()
    }

    
    
}
