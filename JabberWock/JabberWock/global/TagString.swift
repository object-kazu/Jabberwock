//
//  TagString.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/04.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation

class TagString{
    
    var name: String    = ""
    var id: String      = ""
    var cls: String     = ""
    var lang: LANG      = LANG.NO_LANG
    private var language    = ""
    
    var tempOpenString = ""
    var tempCloseString = ""
  
    // br 場合＝True
    var isBRTag     = false
    
    // li, doctype, meta 場合＝True
    var isSingleTag = false
    
    func initialize() {
        id = ""
        cls = ""
        name = ""
    }
    
    func addID (){
        if id.isEmpty {return}
        id = SPC + "id=" + "\"" +  id + "\""
    }
    
    func addCls (){
        if cls.isEmpty {return}
        cls = SPC + "class=" + "\"" + cls + "\""
    }
    
    func addLang (){
        if lang == LANG.NO_LANG {return}
        language = SPC + lang.str()
    }
        
    @discardableResult
    func openString (spec:String) -> String {
        
        tempOpenString = ""
        
        if name.isEmpty {
            return ""
        }
        
        
        if !spec.isEmpty {
            tempOpenString = "<" + name + spec + ">"
            return tempOpenString
        }
        
        // br
        if isBRTag {return ""}

        addID()
        addCls()
        addLang()
        
        tempOpenString = "<" + name + id + cls + language + ">"
        return tempOpenString
    }
    
    @discardableResult
    func openStringReplace (of : String, with:String) -> String {
        tempOpenString = tempOpenString.replacingOccurrences(of: of,  with: with)
        return tempOpenString
    }
    
    @discardableResult
    func closeString (spec:String) -> String {
        tempCloseString = ""

        if name.isEmpty {
            return ""
        }

        // meta
        if name == "meta" {
            return ""
        }

        
        if !spec.isEmpty {
            tempCloseString = "</" + spec + ">"
            return tempCloseString
        }
        
        // br
        if isBRTag {return "<" + name + ">"}
        if isSingleTag {return ""}

        
        tempCloseString = "</" + name + ">"
        return tempCloseString
    }
    
    @discardableResult
    func closeStringReplace (of : String, with:String) -> String {
        tempCloseString = tempCloseString.replacingOccurrences(of: of,  with: with)
        return tempCloseString
    }

    
    
}
