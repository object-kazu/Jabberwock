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
        html.addMember()
        html.press()
    }
    
    func test_addMember () {
        dctype.addMember()
        dctype.addMember(member: html)
        dctype.press()
    }
    
    func test_addChild(){
        let hello = "my first task"
        html.addCihld(child: hello)
        html.addMember()
        html.press()
    }
    
    func test_add_header(){
        // header
        let header = HEADER()
        html.addChild(child: header)
        
        // body
        let hello = "my first task"
        html.addCihld(child: hello)
        html.addMember()
        html.press()
    }
    
    func test_add_header_title(){
        // header
        let header = HEADER()
        header.setTitle(title:"task")
        html.addChild(child: header)
        
        // body
        let hello = "my first task"
        html.addCihld(child: hello)
        html.addMember()
        html.press()
    }
    
    func test_add_header_meta (){
        // header
        let header = HEADER()
        header.setCharset(char: CHARSET.utf8)
        header.setTitle(title: "task")
        html.addChild(child: header)
        
        // body
        let hello = "my first task"
        html.addCihld(child: hello)
        html.addMember()
        html.press()
        
    }
    
    func test_add_h1 (){
        
    }
    
}
