//
//  doctypeTest.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/08.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import XCTest

class doctypeTest: XCTestCase {
    
    let dctype = DOCTYPE()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  
    func test_doctype() {
        dctype.press()
        
        /* answer
         <!DOCTYPE html>
         */

    }
    
    func test_addchild_string() {
        let hello = "my first task"
        dctype.addCihld(child: hello)
        dctype.press()
        
        /* answer
         <!DOCTYPE html>	
                my first task
         
         */
        
    }
    
    func test_add_member(){
        let hello = "my first task"
        dctype.addMember(member: hello)
        dctype.press()

        /* answer
         <!DOCTYPE html>
         my first task
         
         */

    }
    func test_add_members(){
        let hello = "my first task"
        let again = "second task"
        dctype.addMember(member: hello)
        dctype.addMember(member: again)
        dctype.press()
        
        /* answer
         <!DOCTYPE html>
         my first task
         second task
         */
        
    }
    
    func test_add_members_child(){
        let hello = "my first task"
        let again = "second task"
        let forever = "third task"
        dctype.addMember(member: hello)
        dctype.addMember(member: again)
        dctype.addCihld(child: forever)
        dctype.press()
        
        
        /* answer
         <!DOCTYPE html>
         my first task
         second task
            third task
         
         */
        
    }

    func test_add_child_member(){
        
        // check the priority
        // member > child
        
        let hello = "my first task"
        let again = "second task"
        let forever = "third task"
       
        dctype.addMember(member: hello)
        dctype.addCihld(child: forever)
        dctype.addMember(member: again)
        dctype.press()
        
        
        /* answer
         <!DOCTYPE html>
         my first task
         second task
            third task
         
         */
        
    }



}
