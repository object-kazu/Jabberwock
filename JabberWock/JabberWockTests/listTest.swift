//
//  listTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/23.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class listTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   // list = ol, ul
    func test_list() {
        let s = ["test", "llist", "done"]
        let l = ListCore(contents: s)
        l.press()
    }
    
    func test_unoderList()  {
        let u = UL ()
        let s = ["test", "llist", "done"]
        u.contents = s
        u.press()
    }
    
    func test_unorderList_2()  {
        let s = ["test", "llist", "done"]
        let u = UL(contents: s)
        u.press()
    }
    
    func test_orderList () {
        let s = ["test", "llist", "done"]
        let o = OL(contents: s)
        o.press()
    }
    

    // dt
    func test_dLItem () {
        let d = DLItem()
        d.content = "test"
        d.press()
    }
    
    func test_dlist () {
        let s = ["test", "llist", "done"]
        let d = dList(contents: s)
        d.press()
    }
    
    func test_DL()  {
        let s = ["test", "llist", "done"]
        let dl = DL(contents: s)
        dl.press()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
