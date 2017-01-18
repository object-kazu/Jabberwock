//
//  scriptTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/16.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class scriptTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //        <script type="text/javascript" src="test.js"></script>

    func test_script_case1()  {
        let s = SCRIPT(type: "text/javascript", name: "", path: "")
        let x = s.press()
        XCTAssertEqual(x, "<script type=\"text/javascript\">\n</script>")
        
    }
    
    func test_script_case2()  {
        let s = SCRIPT(type: "text/javascript", name: "test.js", path: "")
        let x = s.press()
        XCTAssertEqual(x, "<script type=\"text/javascript\" src=\"/Users/shimizukazuyuki/Desktop/index/test.js\">\n</script>")
        
    }
    
    func test_script_case3(){
        let s = SCRIPT(type: "text/javascript")
        s.addCihld(child: "test1")
        let x = s.press()
        let ans = "<script type=\"text/javascript\">\n\ttest1\t\n</script>"
        XCTAssertEqual(x, ans)
        
        /* answer
         <script type="text/javascript">
            test
         </script>
         
         */
        
    }
    
    func test_script_case4()  {
        let s = SCRIPT(type: "text/javascript", name: "test.js", path: "")
        s.addCihld(child: "test4")
        s.press()
       
        /* answer
         <script type=\"text/javascript\" src=\"/Users/shimizukazuyuki/Desktop/index/test.js\">
            test4
         </script>

        */
    }

    func test_script_case5()  {
        
        let doc = DOCTYPE()
        let p = P(content: "this is next")
        
        let s = SCRIPT(type: "text/javascript", name: "test.js", path: "")
        s.addCihld(child: "test")
        
        doc.addMember(member: s)
        doc.addMember(member: p)
        doc.press()
        
        
        /* answer
         
         => result.txt
         <!DOCTYPE html>
         <script type="text/javascript" src="test.js">
         </script>
         <p>this is next</p>

         => test.js
         test
         
         */
    }

 
}
