//
//  bistrong.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/20.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation


class B : JWSingle {

    override func initilizer () {
        setName(name: "b")
    }

}

class I : JWSingle {
    
    override func initilizer () {
        setName(name: "i")
    }
 
}

class STRONG : JWSingle {
   
    
    override func initilizer () {
        setName(name: "strong")
    }
    
}

class BR : JWSingle {
 
    
    override func initilizer () {
        isBRTag(single: true)
        setName(name: "br")
    }
    
}




