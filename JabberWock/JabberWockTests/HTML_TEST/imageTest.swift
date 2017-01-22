//
//  imageTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/22.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class imageTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    //<img src="image/sample.gif" alt="イラスト２" width=100 height=100>
    
    func test_image_case1 (){
        let i = IMAGE(src: "image/sample.gif", alt: "this is illust", width: "100", height: "100")
        let ans = i.press()
        XCTAssertEqual(ans, "<img src=\"image/sample.gif\" alt=\"this is illust\" width=\"100\" height=\"100\">")
    }
    
    func test_image_case2 (){
        let i = IMAGE(src: "image/sample.gif", alt: "", width: "100", height: "100")
        let ans = i.press()
        XCTAssertEqual(ans, "<img src=\"image/sample.gif\" width=\"100\" height=\"100\">")

    }
    func test_image_case3 (){
        let i = IMAGE(src: "image/sample.gif", alt: "", width: "100", height: "100")
        i.alt = "this is illust"
        let ans = i.press()
        XCTAssertEqual(ans, "<img src=\"image/sample.gif\" alt=\"this is illust\" width=\"100\" height=\"100\">")
        
    }
    
}
