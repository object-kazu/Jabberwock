//
//  htmlTest.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/06.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class htmlTest: XCTestCase {
    
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
    
   
    func test_html_basic() {
        html.press()
    }
    
    func test_add_doctipe(){
        dctype.press()
    }
    
    func test_add_html (){
        dctype.addMember(member: html)
        dctype.press()
    }

    func test_add_html_string() {
        let hello = "my first task"
        dctype.addCihld(child: hello)
        dctype.press()
        
    }
    
    func test_add_member(){
        let hello = "my first task"
        dctype.addMember(member: hello)
        dctype.press()
    }
    
    func test_add_html_head(){
        
        // header
        let head = HEAD()
        html.addChild(child: head)
        
        // html
        dctype.addMember(member: html)
        dctype.press()
    }
    
    func test_add_title () {
        let title = TITLE()
        title.setTile(title: "task")

        dctype.addMember(member: title)
        dctype.press()
    }
      
}
