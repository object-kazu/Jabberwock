//
//  JS_Document.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/16.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation

class JSDocument{
    
    private let name:String = "document"
    
    func write(str: String) -> String {
        return name.dott(nex: "write").inParenth(inn: str) + JS_CMD_END
    }

    
    /*
     Finding HTML Elements
     document.getElementById(id)	Find an element by element id
     document.getElementsByTagName(name)	Find elements by tag name
     document.getElementsByClassName(name)	Find elements by class name
     
     */
    
    func getElememtByID(id : String) -> Element {
        return Element(finder: elementFinder.getElementByID, by: id)
    }
    
}

enum elementFinder: String {
    case getElementByID
    case getElementByTagName
    case getElementByClassName
}

class Element {
    
    private let name:String = "document"
    var finder : String = ""
    var byWhat : String = ""
    
    
    init(finder: elementFinder, by: String) {
        self.finder = finder.rawValue
        self.byWhat = by
    }
    
    func innerHTML (str:String) -> String{
        return name.dott(nex: self.finder).inParenth(inn: byWhat).dott(nex: "innerHTML") +
        EQUAL.inDoubleQuo(inn: str) + JS_CMD_END
    }
}

