//
//  CSS_Study.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/08.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

// ref: http://www.w3schools.com/css/css_examples.asp
// ref: http://weboook.blog22.fc2.com/blog-entry-268.html

class CSS_Study: XCTestCase {
    
    let doc = DOCTYPE()
    let html = HTML()
    let head = HEAD()
    let style = STYLE()
    let body = BODY()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    /* 1. *　（すべての要素に適用）
     
     * {color:red;}

     
     p * {     color:red;}
     
     p要素の中にある要素すべてに適用されます。
     
     ==========================================
     <!DOCTYPE html>
     <html>
     <head>
     <style>
     
     p {
     color: red;
     }
     
     p *{
     color: blue;
     }
     
     </style>
     </head>
     <body>
     
     <p>Red and center-aligned paragraph.</p>
     <p>Red and <b> center-aligned</b> paragraph.</p>
     
     </body>
     </html>

     ======================================
     
     check
      http://www.w3schools.com/code/tryit.asp?filename=FBIU2I8M2CHD
     
     */
    
    func test_all_case1() {
        
        let p1 = P(content: "Red and center-aligned paragraph.")
        let css1 = CSS(name: "p")
        css1.color.value = "red"
        p1.style = css1
        
        let bState = B(content: "center-aligned")
        let p2 = P(content: "Red and " + bState.tgStr() + " paragraph.")
        let css = CSS(name: "p *")
        css.color.value = "blue"
        p2.style = css

        body.addChildren(children: [p1,p2])

        head.addChild(child: style)
        html.addChild(child: head)
        html.addChild(child: body)
        doc.addMember(member: html)
        
        doc.press()
    }
    
}
