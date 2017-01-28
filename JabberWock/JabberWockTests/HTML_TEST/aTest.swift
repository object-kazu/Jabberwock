//
//  aTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/28.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class aTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_A_href()  {
        let a = A()
        a.href(_href: "http://www")
        XCTAssertEqual(a.press(), "<a href=\"http://www\"></a>")
        
    }
    
    func test_A_targe(){
        let a = A()
        a.target(_target: "http://www")
        XCTAssertEqual(a.press(), "<a target=\"http://www\"></a>")
        
    }
    
    func test_A_href_targe(){
        let a = A()
        a.href(_href: "http://www")
        a.target(_target: "http://www")
        XCTAssertEqual(a.press(), "<a href=\"http://www\" target=\"http://www\"></a>")
        
    }
    
}
