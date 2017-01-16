//
//  globaDef.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/15.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

/*
 TODO
 > addした後にcontentにアクセスできるか？アクセスしたい
 > JSを組み込めるか
 
 */

import Foundation

let RET         : String    = "\n"
let TAB         : String    = "\t"
let SPC         : String    = " "
let COMMA       : String    = ","
let COLON       : String    = ":"
let SEMI_COLON  : String    = ";"


let INSERTSTRING: String        = "%%"
let STYLE_CONTENT: String       = "##STYLE##"
let LABEL_INSERT_START : String = "##LABELSTART##"
let LABEL_INSERT_END   : String = "##LABELEND##"

// Table
let BLA: String = "<br>"
let ROW_SPAN = "%rowSpan="
let COL_SPAN = "%colSpan="

extension String {
    var variable: String {
        return LABEL_INSERT_START + self + LABEL_INSERT_END
    }
    
    func ins (data:String) -> (label:String, data:String){
        return (self,data)
    }
}

// - extention
extension String {
    
    var lines: [String] {
        var lines = [String]()
        self.enumerateLines { (line, stop) -> () in
            lines.append(line)
        }
        return lines
    }
    
}

//http://qiita.com/ha_g1/items/d41febac011df4601544
extension String {
    //絵文字など(2文字分)も含めた文字数を返します
    var count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    //正規表現の検索をします
    func pregMatche(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.count > 0
    }
    
    //正規表現の検索結果を利用できます
    func pregMatche(pattern: String, options: NSRegularExpression.Options = [], matches: inout [String]) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let targetStringRange = NSRange(location: 0, length: self.count)
        let results = regex.matches(in: self, options: [], range: targetStringRange)
        for i in 0 ..< results.count {
            for j in 0 ..< results[i].numberOfRanges {
                let range = results[i].rangeAt(j)
                matches.append((self as NSString).substring(with: range))
            }
        }
        return results.count > 0
    }
    
    //正規表現の置換をします
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: with)
    }
}
