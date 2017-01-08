//
//  css_Color_Test.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/05.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class css_Color_Test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_css_color() {
        let css = CSS(name: "")
        css.color.value = "red"
        XCTAssertTrue(css.Str() == "color: red;" + RET)
        
    }
    
    func test_css_color_opacity() {
        let css = CSS(name: "")
        css.color.value = "red"
        css.opacity.value = "0.3"
        XCTAssertTrue(css.Str() == "color: red;" + RET + "opacity: 0.3;" + RET)
        
    }
    
}
