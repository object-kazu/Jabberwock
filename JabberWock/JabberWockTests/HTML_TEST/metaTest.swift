//
//  metaTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/30.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class metaTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_mata () {
        let m = META()
        m.press()
        
        /* answer
            <meta charset="UTF-8"/>
         
         */

    }
    
}
