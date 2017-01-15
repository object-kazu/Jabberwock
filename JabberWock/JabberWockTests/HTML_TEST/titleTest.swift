//
//  titleTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/02.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class titleTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func test_title () {
        let t = TITLE(content: "test")
        let ans = t.press()
        XCTAssertEqual(ans, "<title>test</title>")
        /* answer
            <title>test</title>
         
         */

    }

    func test_title_setTitle () {
        let t = TITLE()
        t.setTile(content: "test")
        let ans = t.press()
        XCTAssertEqual(ans, "<title>test</title>")
        
        /* answer
         <title>test</title>
         
         */
        
    }
 
}
