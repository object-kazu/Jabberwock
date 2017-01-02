//
//  pTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/18.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class pTest: XCTestCase {

    var dctype = DOCTYPE()
    var html = HTML()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Pp() {
        let p = P()
        p.content = "test"
        p.press()
        
        /* answer
         <p>test</p>
         */
    }

    
}
