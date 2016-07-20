//
//  html.swift
//  JabberWockSample1
//
//  Created by kazuyuki shimizu on 2016/07/05.
//  Copyright © 2016年 Momiji-mac.com. All rights reserved.
//

import Foundation

class Doctype : Css {
    var doctype : DOCTYPE = DOCTYPE.MAX
    func stringDocType () -> String {
        switch doctype {
        case .HTML5:
            return "<!DOCTYPE html>"
        case .MAX:
            assertionFailure("set doctype")
            return "<!DOCTYPE html>"
        }
    }
}


class Html5: Css {
    
    var lang = ""
    var charset = ""
    var title = ""
    var style = StyleSheet()
    
    
    func makeStrings () {
        
    }
//    <!DOCTYPE html>
//    <html lang="ja">
//    <head>
//    <meta charset="UTF-8">
//    <title>サイトのタイトル</title>
//    <link rel="stylesheet" type="text/css" href="css/html5reset.css"  />
//    <!--&#91;if lt IE 9&#93;>
//    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
//    <!&#91;endif&#93;-->
//    </head>
//    <body>
//    
//    //ここにサイトに表示するコンテンツ内容を記述
//    
//    </body>
//    </html>
    
    
}

class StyleSheet {
    var rel = ""
    var type = ""
    var href = ""
    
}
class Script {
    var src = ""
}
