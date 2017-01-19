//
//  JS_Basic.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/19.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation
class JS {
    class func dotAdd (str: String) -> String{
        return "." + str
    }
    
    class func inParentheses (str :String) -> String {
        return "(" + SINGLE_QUO + str + SINGLE_QUO + ")"
    }
    
    /*
     <!doctype html>
     <html lang="en">
     <head>
     <script>
     
     function init() {
     var a = 3, b = 2, c = 9;
     var x = (a == b);
     var y = (a>b);
     var z = (b>c);
     
     var str = "x =" + x + ", y=" + y + ", z=" + z;
     document.getElementById("info").textContent = str;
     
     }
     
     </script>
     
     </head>
     <body onload="init()">
     <p id="info"></p>
     </body>
     </html>
     


     
     */

}
