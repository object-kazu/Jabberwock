//
//  headingTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/16.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class headingTest: XCTestCase {
    
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
    

    func test_headings_h1 (){
        let h1 = HEADING()
        h1.level = 0 // h1 tag
        h1.press()
        
        /* answer
         <h1></h1>
         
         */
        
    }
    func test_headings_h6 (){
        let h1 = HEADING()
        h1.level = 10 // h6 tag
        h1.press()
        
        /* answer
         <h6></h6>
         */
    }
    
    func test_heading_contents () {
        let h1 = HEADING()
        h1.level = 1
        h1.content = "test"
        h1.press()
        /* answer
         <h1>test</h1>c
         
         */
    }
    
    func test_heading_init(){
        let h2 = HEADING(level: 2, content: "init test")
        h2.press()
        
        /* answer
         <h2>init test</h2>
         */
        
    }
    
    func test_heading_h1_h2 () {
        let h1 = HEADING()
        h1.level = 1
        h1.content = "test h1"
        
        let h2 = HEADING()
        h2.level = 2
        h2.content = "test h2"
        
        dctype.addMember(member: h1)
        dctype.addMember(member: h2)
        dctype.press()
        /* answer
         <!DOCTYPE html>
         <h1>test h1</h1>
         <h2>test h2</h2>

         
         */
    }

}
