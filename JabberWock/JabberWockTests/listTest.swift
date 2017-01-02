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
    
    // listItem
    func test_listItem() {
        let li = ListItem(content: "test")
        li.press()
        
        /* answer
            <li>test
         
         */

    }
    
    //list
    func test_list () {
        let st = ["test1","test2","test3"]
        let list = List(contents: st)
        list.press()
        /* answer
        
         <li>test1
         <li>test2
         <li>test3
         
         */

    }
    func test_list_content () {
        let st = ["test1","test2","test3"]
        let list = List(contents: st)
        list.content = "new test add"
        list.press()

        /// CAUTION: content > contents
        
        /* answer
         
         <li>new test add
         <li>test1
         <li>test2
         <li>test3

         
         */

    }
    
    
   // list = ol, ul
    func test_list_core() {
        let s = ["test", "list", "done"]
        let lc = ListCore(contents: s)
        lc.press()
        
        /* answer
         <>
            <li>test
            <li>llist
            <li>done
         <>
         
         */

    }
    
    func test_unoderList()  {
        let u = UL ()
        let s = ["test", "llist", "done"]
        u.contents = s
        u.press()
        
        
        /* answer
         <ul>
            <li>test
            <li>llist
            <li>done
         </ul>
         
         */

    }
    
   
    func test_orderList () {
        let s = ["test", "llist", "done"]
        let o = OL(contents: s)
        o.press()
        
        /* answer
         <ol>
            <li>test
            <li>llist
            <li>done
         </ol>
         
         */

    }
    


    // dl, dt, dd
    /*
     <dl>
     <dt>HTML</dt>
     <dd>HyperText Markup Language の略で・・・</dd>
     <dt>WWW</dt>
     <dd>World Wide Web の略で・・・</dd>
     </dl>
     */

    func test_dt () {
        let d = DT()
        d.content = "test"
        d.press()
        
        /* answer
        <dt>test</dt>
         
         */

    }
    func test_dd () {
        let d = DD()
        d.content = "test"
        d.press()
        
        /* answer
         <dd>test</dd>
         
         */
        
    }
    
    func test_dl () {
        let d = DL()
        d.dList = [("test 1", "ans 1"),("test 2", "ans 2"), ]
        d.press()
        /* answer
         <dl>
            <dt>test 1</dt>
            <dd>ans 1</dd>
            <dt>test 2</dt>
            <dd>ans 2</dd>	
         </dl>
         
         */

    }

    
    
    
    
    
    
    
    
    
    
    
    
    
}
