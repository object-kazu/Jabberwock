//
//  divTest.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/05.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class divTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_div (){
        let d = DIV()
        let p1 = P(content: "test 1")
        let p2 = P(content: "test 2")
        
        d.addChild(child: p1)
        d.addChild(child: p2)
        d.press()
        
        /* answer
         <div>
            <p>test 1</p>
            <p>test 2</p>
         </div>
         
         
         */

    }
    
    func test_div_addchildren (){
        let d = DIV()
        let p1 = P(content: "test 1")
        let p2 = P(content: "test 2")
        
        d.addChildren(children: [p1,p2])
        d.press()
        
        /* answer
         <div>
            <p>test 1</p>
            <p>test 2</p>
         </div>
         
         
         */
        
    }

}
