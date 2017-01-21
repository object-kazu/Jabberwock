//
//  aTagTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/21.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class aTagTest: XCTestCase {
    
    let HREF = "http://example.com"
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_A_case1() {
        let a = A(href: HREF)
        XCTAssertEqual(a.press(), "<a href=" + HREF + "></a>")
        
    }
    
    func test_A_case2() {
        let a = A(href: HREF)
        a.content = "this is test"
        XCTAssertEqual(a.press(), "<a href=" + HREF + ">this is test</a>")
        
    }
    
}
