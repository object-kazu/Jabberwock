//
//  headTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/16.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class headTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_add_header_title(){
        // head
        let head = HEAD()
        head.setTitle(of:"task")
        head.press()
        
        /* answer
         <head>
            <title>task</title>
         </head>
         
         */
    }
    func test_add_header_meta(){
        // head
        let head = HEAD()
        head.setTitle(of:"task")
        head.setCharset(of: CHARSET.utf8)
        head.press()
        
        /* answer
         <head>
            <title>task</title>
            <meta charset="UTF-8"/>
         </head>
         
         */
    }
    
    func test_add_doctype () {
        // doctype
        let doc = DOCTYPE()
        
        
        // head
        let head = HEAD()
        head.setTitle(of:"task")
        head.setCharset(of: CHARSET.utf8)
        
        doc.addMember(member: head)
        doc.press()
        
        /* answer
         <!DOCTYPE html>
         <head>
            <title>task</title>
            <meta charset="UTF-8""/>
         </head>
         
         */

    }
    
//    func test_add_header_meta (){
//        // head
//        let head = HEAD()
//        head.setCharset(of: CHARSET.utf8)
//        head.setTitle(of: "task")
//        html.addChild(child: head)
//        
//        // body
//        dctype.addMember(member: html)
//        dctype.press()
//        
//        /* answer
//         
//         <!DOCTYPE html>
//         <html lang="en">
//            <head>
//                <meta charset="UTF-8""/>
//                <title>task</title>
//            </head>
//         </html>
//
//         */
//        
//    }
   
}
