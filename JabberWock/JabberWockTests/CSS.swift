//
//  CSS.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/05.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation


class CSS {
    
    var cssName : String!
    
    // color
    var color       : csColor    = csColor()
    var opacity     : csOpacity  = csOpacity()

    
    // background
    var background  : CSSItem   = CSSItem()
    
    init(name:String) {
        self.cssName = name
    }
    
    func Str() -> String  {
        
        if cssName.isEmpty {
            return ""
        }
        
        var cssResultString: String = ""
        // 接頭句
        cssResultString += cssName + SPC + "{" + RET
        
        
        // color
        cssResultString += color.cssItemStr()
        cssResultString += opacity.cssItemStr()
        
        
        // background
        cssResultString += background.cssItemStr()
        
        
        // 接尾句
        cssResultString += "}"
        return cssResultString
    }
    
    // todo universal selector
    //var universalSelector
    
    /*
     ■ユニバーサルセレクタ：（全要素に適用）
     * { プロパティ: 値; }
     代表的なブラウザでは、h1要素やp要素などに、最初からマージン（余白）が付加されて表示されます。それらを一括してなくす目的で、以下のようにユニバーサルセレクタが使えます。
     * { margin: 0px; }
     上記のように記述すると、あらゆる要素のマージンがゼロになります。
     
     ■タイプセレクタ：（指定の要素だけに適用）
     要素名 { プロパティ: 値; }
     以下のように記述すると、h1要素に限定して、文字色が緑色になります。
     h1 { color: green; }
     
     ■クラスセレクタ：（指定のクラスだけに適用）
     .クラス名 { プロパティ: 値; }
     以下のように記述すると、appleクラスが付加された要素に限定して、文字色が赤色になります。
     .apple { color: red; }
     
     ■IDセレクタ：（指定のIDだけに適用）
     #ID名 { プロパティ: 値; }
     以下のように記述すると、IDが「grape」の要素に限定して、文字色が紫色になります。
     #grape { color: purple; }
     
     */
    
}
