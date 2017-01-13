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
    
    func test_assemble() {
        jw.openString = "test"
        jw.closeString = "done"
        jw.press()
    }
    
    // label
    func test_label_case1 (){
        let j = JWSingle()
        j.content = "test" + j.V(label: "a")
        j.press()
        XCTAssertEqual(j.resultString, "<>test</>")
    }
    
    func test_label_case2 (){
        let j = JWSingle()
        j.content = "test" + j.V(label: "a")
        j.press()
        j.insertPress(_data_: [("a", " is done")])
        XCTAssertEqual(j.resultString, "<>test is done</>")
        
    }
    
    
     
}
