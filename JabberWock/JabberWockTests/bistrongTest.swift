//
//  bistrongTest.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/20.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class bistrongTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_b (){
        let bb = B()
        bb.content = "bold"
        bb.press()
    }
    
    func test_b_init () {
        let bb = B(content: "bold")
        bb.press()
    }
    
    func test_i () {
        let ii = I()
        ii.content = "italic test"
        ii.press()
    }
    
    func test_i_init (){
        let ii = I(content: "italic")
        ii.press()
    }
    
    func test_strong () {
        let st = STRONG()
        st.content = "strong"
        st.press()
    }
    
    func test_strong_init () {
        let st = STRONG(content: "stronger")
        st.press()
    }
    
}
