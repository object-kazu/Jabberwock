//
//  tableTest.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/02.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

class tableTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_add_caption (){
        let t = TABLE()
        t.setCaption(cap: "test")
        t.press()
        
        /* answer
         <table>
            <captiom>test</caption>
         </table>
         
         */

    }
    
    func test_add_header () {
        let t = TABLE()
        t.setCaption(cap: "test")
        let hl = ["name", "address", "tel"]
        t.setHeadList(header: hl)
        t.press()
        
        /* answer
         <table>
         <captiom>test</caption>
         <tr><th></th><th>name</th><th>address</th><th>tel</th></tr>
         </table>
         */

    }

    func test_add_data () {
        let t = TABLE()
        t.setCaption(cap: "test")
        let hl = ["name", "address", "tel"]
        t.setHeadList(header: hl)
        
        //add data
        
        let data = ["line1", "shi", "tokyo", "03000000"]
        t.setData(d: [data])
        
        t.press()
        
        /* answer
         <table>
         <captiom>test</caption>
         <tr><th></th><th>name</th><th>address</th><th>tel</th></tr>
         <tr><td>line1</td><td>shi</td><td>tokyo</td><td>03000000</td></tr>
         </table>
         */
        
    }
    func test_add_data2 () {
        let t = TABLE()
        t.setCaption(cap: "test")
        let hl = ["name", "address", "tel"]
        t.setHeadList(header: hl)
        
        //add data
        
        let data = ["line1", "shi", "tokyo", "03000000"]
        let data2 = ["line2", "shi2", "tokyo2", "030000002"]
        t.setData(d: [data, data2])
        
        t.press()
        
        /* answer
         <table>
         <captiom>test</caption>
         <tr><th></th><th>name</th><th>address</th><th>tel</th></tr>
         <tr><td>line1</td><td>shi</td><td>tokyo</td><td>03000000</td></tr>
         <tr><td >line2</td><td >shi2</td><td >tokyo2</td><td >030000002</td></tr>
         </table>
         */
        
    }
    
    func test_add_blank () {
        let t = TABLE()
        t.setCaption(cap: "test")
        let hl = ["name", "address", "tel"]
        t.setHeadList(header: hl)
        
        //add data
        
        let data = ["line1", "shi", "tokyo", "03000000"]
        let data2 = [BLA, "shi2", "tokyo2", "030000002"]
        t.setData(d: [data, data2])
        
        t.press()
        
        /* answer
         <table>
         <captiom>test</caption>
         <tr><th></th><th>name</th><th>address</th><th>tel</th></tr>
         <tr><td >line1</td><td >shi</td><td >tokyo</td><td >03000000</td></tr>
         <tr><td ><br></td><td >shi2</td><td >tokyo2</td><td >030000002</td></tr>
         </table>
         */
        
    }

    func test_add_rowSpan () {
        let t = TABLE()
        t.setCaption(cap: "test")
        let hl = ["name", "address", "tel"]
        t.setHeadList(header: hl)
        
        //add data
        
        let data = ["line1", "shi", "tokyo", "03000000"]
        let data2 = ["line2," + ROW_SPAN + "10", "shi2", "tokyo2", "030000002"]
        t.setData(d: [data, data2])
        
        t.press()
        
        /* answer
         <table>
            <captiom>test</caption>
            <tr><th></th><th>name</th><th>address</th><th>tel</th></tr>
            <tr><td >line1</td><td >shi</td><td >tokyo</td><td >03000000</td></tr>
            <tr><tdrowspan=10 >line2</td><td >shi2</td><td >tokyo2</td><td >030000002</td></tr>
         </table>
         */
        
    }

}
