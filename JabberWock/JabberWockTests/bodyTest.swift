//
//  body.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/20.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class bodyTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_body (){
        let bo = BODY()
        bo.press()
        
        /* answer
         <body>
         </body>
         
         */
    }
    
    func test_body_addchild (){
        let bo = BODY()
        bo.addCihld(child: "test")
        bo.press()
        
        /* answer
         <body>
            test
         </body>
         
         */
    }
    func test_body_addchild2 (){
        let bo = BODY()
        bo.addCihld(child: "test 1")
        bo.addCihld(child: "test 2")
        bo.addCihld(child: "test 3")

        bo.press()
        
        /* answer
         <body>
            test 1
            test 2
            test 3
         </body>
         
         */
    }
    func test_body_addchild_B (){
        let bo = BODY()
        bo.addChild(child: B(content: "test 1"))
        bo.addChild(child: B(content: "test 2"))
        bo.addChild(child: B(content: "test 3"))

        
        bo.press()
        
        /* answer
         <body>
            <B>test 1</B>
            <B>test 2</B>
            <B>test 3</B>
         </body>
         
         */
    }
    
    func test_body_addchild_member (){
        let bo = BODY()
        bo.addChild(child: B(content: "test 1"))

        bo.addMember(member: B(content: "test 4"))
            
        bo.addChild(child: B(content: "test 2"))
        bo.addChild(child: B(content: "test 3"))
        
        
        bo.press()
        
        /* answer
         <body>
            <B>test 1</B>
            <B>test 2</B>
            <B>test 3</B>
         </body>
         <B>test 4</B>
         
         */
    }
    
    
}
