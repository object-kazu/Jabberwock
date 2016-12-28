//
//  headTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/16.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class headTest: XCTestCase {
    
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
    
    func test_html () {
        html.press()
    }
    
    func test_add_header_title(){
        // head
        let head = HEAD()
        head.setTitle(title:"task")
        html.addChild(child: head)
        
        dctype.addMember(member: html)
        dctype.press()
    }
    
    func test_add_header_meta (){
        // head
        let head = HEAD()
        head.setCharset(char: CHARSET.utf8)
        head.setTitle(title: "task")
        html.addChild(child: head)
        
        // body
        dctype.addMember(member: html)
        dctype.press()
        
    }
   
}
