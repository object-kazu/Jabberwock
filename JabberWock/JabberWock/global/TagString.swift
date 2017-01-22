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
    
    //script tag
    var jsPath    : String    = ""
    var jsPathPlusName :String   = ""
    var jsFileName: String    = ""
    var jsType    : String    = ""
    
    var tempOpenString = ""
    var tempCloseString = ""
  
    // br 場合＝True
    var isBRTag     = false
    
    // li, doctype, meta 場合＝True
    var isSingleTag = false
    
    // <a href, target ></a>
    var href :String    = ""
    var target :String  = ""
    
    func initialize() {
        id          = ""
        cls         = ""
        name        = ""
        jsFileName  = ""
        jsPath      = ""
        jsType      = ""
    }
    
    
    // tag judgemnet
    private func isScriptTag() -> Bool {
        return name == "script" ? true : false
    }
    
    private func isATag() -> Bool {
        return name == "a" ? true : false
    }
    
    // add id, cls, path, etc
    private func addID (){
        if id.isEmpty {return}
        id = SPC + "id=" + DOUBLE_QUO +  id + DOUBLE_QUO
    }
    
    private func addCls (){
        if cls.isEmpty {return}
        cls = SPC + "class=" + DOUBLE_QUO + cls + DOUBLE_QUO
    }
    
    private func addLang (){
        if lang == LANG.NO_LANG {return}
        language = SPC + lang.str()
    }
    
    // js
    private func addPath() {
        
        if jsFileName.isEmpty {return}
        if jsPath.isEmpty {
            jsPath = EXPORT_TEST_JS_Dir
        }
        
        jsPathPlusName = SPC + "src=" + DOUBLE_QUO + jsPath + jsFileName + DOUBLE_QUO
    }
    
    private func addType()  {
        if jsType.isEmpty{return}
        jsType = SPC + "type=" + DOUBLE_QUO + jsType + DOUBLE_QUO
    }
    
    
    /// js <script></script>に挟まれた文字列を取り出す
    func extranctBetweenScriptTag (target: [String]) -> (scriptTag:[String], extract:[String]) {
        /*
         [0] = "<!DOCTYPE html type=\"text/javascript\" src=\"/Users/shimizukazuyuki/Desktop/index/test.js\">"
         [1] = "<script type=\"text/javascript\" src=\"/Users/shimizukazuyuki/Desktop/index/test.js\">"
         [2] = "\ttest\t"
         [3] = "</script>"
         
         */
        
        var s : [String] = []
        var e : [String] = []
        
        var start = false
        for st in target {
            if st.contains("<script") {
                s.append(st)
                start = true
                continue
            }
            
            if st.contains("</script>") {
                s.append(st)
                start = false
                continue
            }
            
            if start {
                e.append(st)
                
            }else{
                s.append(st)
            }
            
            
        }
        return (scriptTag: s, extract: e)
    }

    
    /*
     => isNeedJsSrc
     <script type="text/javascript" src="/Users/shimizukazuyuki/Desktop/index/test.js"></script>
     
     => InDocument
     <script type="text/javascript"></script>
     
     
     */
    
    func isJsAvailable () -> Bool {
        if !jsType.isEmpty || !jsPath.isEmpty || !jsFileName.isEmpty { // <script> available
            return true
        }else{
            return false
        }
    }
    
    func isNeedJsSrc () -> Bool {
        if isJsAvailable() {
            if !jsFileName.isEmpty {
                return true
            }
        }
        return false
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
     
        /// id, clsなどの指定が必要Tagはここより下に記入
        
        addID()
        addCls()
        addLang()
        addPath()
        addType()
        
        // script
        if isScriptTag() {
            return scriptTag()
        }
        
        //<a>
        if isATag(){
            return ATag()
        }
        
        tempOpenString = "<" + name + id + cls + language + ">"
        return tempOpenString
    }
    
    private func ATag() -> String {
        if !href.isEmpty {
            href = SPC + "href=" + href
        }
        if !target.isEmpty {
            target = SPC + "target=" + target
        }
        
        tempOpenString = "<" + name + id + cls + href + target + ">"
        return tempOpenString
        
    }
    
    private func scriptTag () -> String {
        tempOpenString = "<" + name + id + cls + language + jsType + jsPathPlusName + ">"
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

        // not require
        /// meta, img
        if spec == NOT_REQUIRE {
            return ""
        }
//        if name == "meta" || name == "image" {
//            return ""
//        }

        
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
