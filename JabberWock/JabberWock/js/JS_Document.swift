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
     document.querySelectorAll("p.intro");
     
     */
    
    func getElememtBy(ID : String) -> Element {
        return Element(getElementBy: .ByID, thatIs: ID)
    }
    
    func getElementBy(TagName:String) -> Element {
        return Element(getElementBy: .ByTagName, thatIs: TagName)
    }
    
    func getElementBy(ClassName:String) -> Element {
        return Element(getElementBy: .ByClassName, thatIs: ClassName)
    }
    
    func query(selectAll:String) -> Element {
        return Element(getElementBy: .QuerySelectAll, thatIs: selectAll)
    }
    
}

enum getElement: String {
    case ByID           = "getElementById"
    case ByTagName      = "getElementByTagName"
    case ByClassName    = "getElementByClassName"
    case QuerySelectAll = "querySelectorAll"
}

class Element {
    
    private let name:String = "document"
    var getBy  : String = ""
    var thatIs : String = ""
    var element: String = ""
    
    init(getElementBy: getElement, thatIs: String) {
        self.getBy = getElementBy.rawValue
        self.thatIs = thatIs
        self.element = name.dott(nex: self.getBy).inParenth(inn: thatIs)
    }
    
    
    /*
     Changing HTML Elements
     Method	Description
     element.innerHTML =  new html content	Change the inner HTML of an element
     element.attribute = new value	Change the attribute value of an HTML element
     element.setAttribute(attribute, value)	Change the attribute value of an HTML element
     element.style.property = new style	Change the style of an HTML element
     
     */
    
    func innerHTML (str:String) -> String{
        return self.element.dott(nex: "innerHTML") +
        EQUAL.inDoubleQuo(inn: str) + JS_CMD_END
    }
    
    
    
}

