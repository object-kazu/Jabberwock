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
    
    // <b>
    func test_b (){
        let bb = B()
        bb.content = "bold"
        bb.press()
        
        /* answer
         <b>bold</b>
         
         */
    }
    
    func test_b_init () {
        let bb = B(content: "bold")
        bb.press()
        /* answer
         <b>bold</b>
         
         */

    }
    
    func test_b_tSt (){
        let test = "bold string"
        let ans = "<b>bold string</b>"
        let bb = B(content: test)
        let t = bb.tgStr()
        
        XCTAssertNotEqual(test, t)
        XCTAssertEqual(ans, t)  
    }
    
    
    // <i>
    func test_i () {
        let ii = I()
        ii.content = "italic test"
        ii.press()
        
        /* answer
         <i>italic test</i>
         */

    }
    
    func test_i_init (){
        let ii = I(content: "italic")
        ii.press()
        /* answer
         
         <i>italic</i>
         */

    }
    
    
    
    //<strong>
    func test_strong () {
        let st = STRONG()
        st.content = "strong"
        st.press()
        
        /* answer
         <strong>strong</strong>
         */

    }
    
    func test_strong_init () {
        let st = STRONG(content: "stronger")
        st.press()
        /* answer
         <strong>stronger</strong>
         */

    }
    
    // </br>
    func test_br () {
        let br = BR()
        br.content = "this is br testing"
        br.press()
        /* answer

         this is br testing<br>
         */

    }
    
    func test_p_and_br () {
        let br = BR(content: "this is test")
        let p = P()
        p.contents = ["test1", "test2" + br.tgStr() + "yes!" , "test3"]
        p.press()
        /* answer
         <p>test1</p>
         <p>test2this is test<br>yes!</p>
         <p>test3</p>
         
         */

    }
}
