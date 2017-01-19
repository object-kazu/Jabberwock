//
//  JS_Document.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/19.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class JS_Document: XCTestCase {
    
    let doc = DOCTYPE()
    let html = HTML()
    let head = HEAD()
    let body = BODY()
    let jsd = JSDocument()

    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_document_write_case1 (){
        
        let js = SCRIPT(type: "text/javascript")
        let st = jsd.write(str: "this is test")
        js.addCihld(child: st)
        
        head.addChild(child: js)
        html.addChildren(children: [head, body])

        doc.addMember(member: html)
        doc.press()
    }
    
    func test_write(){
        let ans = jsd.write(str: "test")
        XCTAssertEqual(ans, "document.write('test')")
    }
    
    func test_getElementByID_case1 () {
        let ans = jsd.getElememtByID(id: "test1").innerHTML(str: "test is done")
        XCTAssertEqual(ans, "document.getElementByID('test1').innerHTML=\"test is done\";")
    }

    
}
