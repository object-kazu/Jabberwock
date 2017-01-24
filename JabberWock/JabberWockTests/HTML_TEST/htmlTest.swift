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
        let a = html.press()
        XCTAssertEqual(a, "<html>\n</html>")
        /*
         <html>
         </html>
         */
        
    }
    
    
    func test_add_html (){
        html.setLang(lang: LANG.en)
        dctype.addMember(member: html)
        dctype.press()
        
        /* answer
         <!DOCTYPE html>
         <html lang="en">
         </html>
         */
    }

   
    func test_add_html_head(){
        
        // header
        let head = HEAD()
        html.addChild(child: head)
        html.setLang(lang: LANG.en)
        
        // html
        dctype.addMember(member: html)
        dctype.press()
        
        
        /* answer
         <!DOCTYPE html>
         <html lang="en">
            <head>
            </head>
         </html>
         */
        
    }
}
