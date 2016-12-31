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
    func test_p()  {
        let p = P()
        p.contents = ["this is test","next is example"]
        p.press()
        /* answer
         <p>this is test</p>
         <p>next is example</p>
         
         */
        
    }
    
    func test_p_init()  {
        let p = P(contents: ["this is test","next is example"])
        p.press()

        /* answer
         <p>this is test</p>
         <p>next is example</p>
         
         */
        
    }
    func test_p_content_contents()  {
        let p = P(contents: ["this is test","next is example"])
        p.content = "add new test"
        p.press()
        
        ///CAUTION! content > contents
        
        /* answer
         <p>add new test</p>
         <p>this is test</p>
         <p>next is example</p>

         
         */
        
    }
    

    
}
