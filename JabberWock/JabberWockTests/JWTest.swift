//
//  JWTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/03.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class JWTest: XCTestCase {
    
    let jw = JW()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_press() {
        jw.resultString = "test"
        jw.press()
    }
    
    func test_assemble_Multi_true () {
        jw.openString = "test"
        jw.closeString = "done"
        jw.isMultiLine = true
        jw.assemble()
        jw.press()
    }
    
    func test_assemble_Multi_false () {
        jw.openString = "test"
        jw.closeString = "done"
        jw.isMultiLine = false
        jw.assemble()
        jw.press()
    }
    
    func test_addChild_string () {
        jw.isMultiLine = false
      
        let s = "test"
        jw.addCihld(child: s)
        jw.press()
        
        /* answer
         	test
        */
    }
    
    
    
}
