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
  
    // br 場合＝True
    var isBRTag     = false
    
    // li, doctype, meta 場合＝True
    var isSingleTag = false
    
    func initialize() {
        id = ""
        cls = ""
    }
    
    func addID (){
        if id == "" {return}
        id = SPC + "id=" + "\"" +  id + "\""
    }
    
    func addCls (){
        if cls == "" {return}
        cls = SPC + "class=" + "\"" + cls + "\""
    }
    
    func addLang (){
        if lang == LANG.NO_LANG {return}
        language = SPC + lang.str()
    }
    
    
    func openString () -> String {
        
        // br
        if isBRTag {return ""}

        addID()
        addCls()
        addLang()
        
        return "<" + name + id + cls + language + ">"
    }
    
    func closeString () -> String {
        // br
        if isBRTag {return "<" + name + ">"}
        if isSingleTag {return ""}

        return "</" + name + ">"
    }
}
