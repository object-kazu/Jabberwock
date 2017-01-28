//
//  JS_WindowTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/18.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class JS_WindowTest: XCTestCase {
    let doc = DOCTYPE()
    let head = HEAD()
    let body = BODY()
    let jsw = JSWindow()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_window_defaultStatus () {
        let jw = JSWindow()
        let a = jw.defaultStatus(str: "this is test")
        XCTAssertEqual(a, "window.defaultStatus=\"this is test\"")
    }
    
    
    func test_window_defaultStatus_case_2(){
        let js = SCRIPT(type: "text/javascript")
        let st = jsw.defaultStatus(str: "welcom")
        js.addCihld(child: st)
        
        head.addChild(child: js)
        doc.addMember(member: head)
        doc.addMember(member: body)
        doc.press()
        
        //    <html>
        //    <head>
        //    <script type="text/javascript" >
        //    window.defaultStatus='welcom';
        //    </script>
        //    </head>
        //    <body>
        //    </body>
        //    </html>
    }

}
