//
//  TagAttribute.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/23.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation

class TagAttribute {
   
    var aString = ""
   
    
    func add (lang: LANG){
        if lang == LANG.NO_LANG {return}
        aString += SPC + lang.str()
    }
    
    func templeteAdd (index:String, val:String) {
        if !val.isEmpty {
            aString += SPC + index + "=".inDoubleQuo(inn: val)
        }
    }
    
    func add(title : String){
        templeteAdd(index: "title", val: title)
    }
    
    
    
}
