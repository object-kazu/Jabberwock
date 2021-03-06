//
//  mixHtmlTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/24.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class mixHtmlTest: XCTestCase {
    
    var doc = DOCTYPE()
    var html = HTML()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    func test_task20161201() {

        //head
        let head = HEAD()
        
        let meta = META()
        meta.setCharset(of: CHARSET.utf8)
        
        let title = TITLE(content: "task")
        
        head.addChild(child: meta)
        head.addChild(child: title)
        
        //body
        let body = BODY()
        let h1 = HEADING(level: 1, content: "This is TODO")
        let a = "My first task"
        let b = B(content: "Next TODO").tgStr()
        let c = STRONG(content: "1. html").tgStr()
        let pa = P(content: a)
        let pb = P(content: b)
        let pc = P(content: c)
        
        body.addChild(child: h1)
        body.addChild(child: pa)
        body.addChild(child: pb)
        body.addChild(child: pc)
        
        html.setLang(lang: LANG.en)
        html.addChild(child: head)
        html.addChild(child: body)
        
        doc.addMember(member: html)
        doc.press()
        
        /* answer
         <!DOCTYPE html>
         <html lang="en">
            <head>
                <meta charset="UTF-8""/>
                <title>task</title>
            </head>
            <body>
                <h1>This is TODO</h1>
                <p>My first task</p>
                <p><b>Next TODO</b></p>
                <p><strong>1. html</strong></p>
         
            </body>
         </html>
         
         
         */

    }
    
//    func test_html_css () {
//        //head
//        let head = HEAD()
//        
//        let meta = META()
//        meta.setCharset(of: CHARSET.utf8)
//        
//        let title = TITLE(content: "task")
//        let css = CSS(name: "title")
//        css.color.value = "red"
//        title.style = css
//        let style = STYLE()
//        
//        head.addChildren(children: [meta, title, style])
//      
//
//        
//        //body
//        let body = BODY()
//        let h1 = HEADING(level: 1, content: "This is TODO")
//        let a = "My first task"
//        let b = B(content: "Next TODO").tgStr()
//        let c = STRONG(content: "1. html").tgStr()
//        let pa = P(content: a)
//        let pb = P(content: b)
//        let pc = P(content: c)
//        
//        body.addChildren(children: [h1,pa,pb,pc])
//        html.addChildren(children: [head,body])
//        
//        doc.addMember(member: html)
//        doc.press()
//        
//        XCTAssertEqual(doc.styleStr(), "title {" + RET + "color: red;" + RET + "}")
//
//        
//    }
    
//    func test_html_css_2 () {
//        //head
//        let head = HEAD()
//        
//        let meta = META()
//        meta.setCharset(of: CHARSET.utf8)
//        
//        let title = TITLE(content: "task")
//        let css = CSS(name: "title")
//        css.color.value = "red"
//        title.style = css
//        let style = STYLE()
//        
//        head.addChildren(children: [meta, title, style])
//        
//        
//        
//        //body
//        let body = BODY()
//        let css2 = CSS(name: "body")
//        css2.color.value = "red"
//        body.style = css2
//        
//        let h1 = HEADING(level: 1, content: "This is TODO")
//        let a = "My first task"
//        let b = B(content: "Next TODO").tgStr()
//        let c = STRONG(content: "1. html").tgStr()
//        let pa = P(content: a)
//        let pb = P(content: b)
//        let pc = P(content: c)
//        
//        body.addChildren(children: [h1,pa,pb,pc])
//        html.addChildren(children: [head,body])
//        
//        doc.addMember(member: html)
//        doc.press()
//        
//        XCTAssertEqual(doc.styleStr(), "title {" + RET +
//            "color: red;" + RET +
//            "}" + RET +
//            "body {" + RET +
//            "color: red;" + RET +
//            "}"
//        )
//        
//    }
    
}
