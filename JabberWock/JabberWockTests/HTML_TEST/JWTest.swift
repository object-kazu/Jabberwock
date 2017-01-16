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
        jw.templeteString = "test"
        let ans = jw.press()
        XCTAssertEqual(ans, "test")
    }
    
    func test_assemble() {
        jw.tagManager.name = "test"
        let ans = jw.press()
        XCTAssertEqual(ans, "<test>\n</test>")
    }

    // label
    func test_label_case1 (){
        let j = JWSingle()
        j.setName(name: "j")
        j.content = "test" + "a".variable
        let ans = j.press()
        XCTAssertEqual(ans, "<j>test</j>")
    }

    func test_label_case2 (){
        let j = JWSingle()
        j.setName(name: "j")
        j.content = "test" + "a".variable
        let fAns = j.press()
       
        XCTAssertEqual(fAns, "<j>test</j>")

        let sAns = j.insertPress(_data_: ["a".ins(data: " is done")])
        XCTAssertEqual(sAns, "<j>test is done</j>")
        
    }

    func test_label_case2_Dash (){
        let j = JWSingle()
        j.setName(name: "j")
        j.content = "test" + "a".variable
        let fAns = j.press()
        XCTAssertEqual(fAns, "<j>test</j>")
        
        
        let sAns = j.insertPress(_data_: [("a", " is done")])
        XCTAssertEqual(sAns, "<j>test is done</j>")
        
    }

    func test_label_case3 (){
        let j = JWSingle()
        j.setName(name: "j")
        j.content = "test" + "a".variable
        j.press()
        
        let sAns = j.insertPress(_data_: ["a".ins(data: " is done")])
        XCTAssertEqual(sAns, "<j>test is done</j>")

        let tAns = j.insertPress(_data_: ["a".ins(data: " is done new")])
        XCTAssertEqual(tAns, "<j>test is done new</j>")
        
        let x = "a".ins(data: " was changed")
        let uAns = j.insertPress(_data_: [x])
        XCTAssertEqual(uAns, "<j>test was changed</j>")
        
    }

    
     
}
