//
//  CSS_Study.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/08.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import XCTest

// ref: http://www.w3schools.com/css/css_examples.asp
// ref: http://weboook.blog22.fc2.com/blog-entry-268.html

class CSS_Study: XCTestCase {
    
    let doc = DOCTYPE()
    let html = HTML()
    let head = HEAD()
    let style = STYLE()
    let body = BODY()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
    /* 1. *　（すべての要素に適用）
     
     * {color:red;}

     
     p * {     color:red;}
     
     p要素の中にある要素すべてに適用されます。
     
     ==========================================
     <!DOCTYPE html>
     <html>
     <head>
     <style>
     
     p {
     color: red;
     }
     
     p *{
     color: blue;
     }
     
     </style>
     </head>
     <body>
     
     <p>Red and center-aligned paragraph.</p>
     <p>Red and <b> center-aligned</b> paragraph.</p>
     
     </body>
     </html>

     ======================================
     
     check
      http://www.w3schools.com/code/tryit.asp?filename=FBIU2I8M2CHD
     
     */
    
    func test_all_case1() {
        
        let p1 = P(content: "Red and center-aligned paragraph.")
        let css1 = CSS(tag: p1)
        css1.color.value = "red"
        p1.style = css1
        
        let bState = B(content: "center-aligned")
        let p2 = P(content: "Red and " + bState.tgStr() + " paragraph.")
        let css = CSS(tag: p2, with: "*")
        css.color.value = "blue"
        p2.style = css

        body.addChildren(children: [p1,p2])

        head.addChild(child: style)
        html.addChild(child: head)
        html.addChild(child: body)
        doc.addMember(member: html)
        
        doc.press()
    }
    
    /* 2. 
     .X　（指定したクラス名がある要素に適用）
     クラス名を指定した要素にスタイルが適用されます。
     
     
     
     ==========================================
     <!DOCTYPE html>
     <html>
     <head>
     <style>
     
     .sample {
        color:yellow;
     }

     p {
        color: red;
     }
     
     p *{
        color: blue;
     }
     
     </style>
     </head>
     <body>
     
     <p>Red and center-aligned paragraph.</p>
     <p>Red and <b> center-aligned</b> paragraph.</p>
     <p class="sample">この中身に適用されます<p>
     
     </body>
     </html>

     
     
     ======================================
     
     check
     http://www.w3schools.com/code/tryit.asp?filename=FBJ0XQ3XP229
     
     */
    func test_class_case1() {
        
        let p1 = P(content: "Red and center-aligned paragraph.")
        let css1 = CSS(tag: p1)
        css1.color.value = "red"
        p1.style = css1
        
        let bState = B(content: "center-aligned")
        let p2 = P(content: "Red and " + bState.tgStr() + " paragraph.")
        let css = CSS(tag: p2, with: "*")
        css.color.value = "blue"
        p2.style = css
        
        let p3 = P(content: "この中身に適用されます")
        p3.setCls(cls: "sample")
        let css3 = CSS(cls: p3)
        css3.color.value = "yellow"
        p3.style = css3
        
        body.addChildren(children: [p1,p2, p3])
        
        head.addChild(child: style)
        html.addChild(child: head)
        html.addChild(child: body)
        doc.addMember(member: html)
        
        doc.press()
    }
    
    /*
     
     ==========================================
     
     <!DOCTYPE html>
     <html>
     <head>
     <style>

     p.sample {
        font-size:28px;
        color:red;
     }
     
     .sample {
        color:yellow;
     }
     
     p {
        color: red;
     }
     
     p *{
        color: blue;
     }
     
     </style>
     </head>
     <body>
     
     <p>Red and center-aligned paragraph.</p>
     <p>Red and <b> center-aligned</b> paragraph.</p>
     <p class="sample">この中身に適用されます</p>
     <div class="sample">この中身には適用されません</div>
     
     </body>
     </html>

     
     ======================================
     
     check
      http://www.w3schools.com/code/tryit.asp?filename=FBJACCVCVF60
     
     */
    
    func test_class_case2() {
        
        let p1 = P(content: "Red and center-aligned paragraph.")
        let css1 = CSS(tag: p1)
        css1.color.value = "red"
        p1.style = css1
        
        let bState = B(content: "center-aligned")
        let p2 = P(content: "Red and " + bState.tgStr() + " paragraph.")
        let css = CSS(tag: p2, with: "*")
        css.color.value = "blue"
        p2.style = css
        
        let p3 = P(content: "この中身に適用されます")
        p3.setCls(cls: "sample")
        let css3 = CSS(name: p3.getTagName() + "." + p3.getTagCls())
        css3.color.value = "red"
        css3.fontSize.value = "28px"
        p3.style = css3
        
        let p4 = DIV()
        p4.setCls(cls: "sample")
        let css4 = CSS(cls: p4)
        css4.color.value = "yellow"
        p4.style = css4
        let st = "この中身には適用されません"
        p4.addCihld(child: st)
        
        body.addChildren(children: [p1,p2, p3,p4])
        
        head.addChild(child: style)
        html.addChild(child: head)
        html.addChild(child: body)
        doc.addMember(member: html)
        
        doc.press()
    }
    
    func test_class_case3() { // same result with  "test_class_case2"
        /*
         cssの設定の仕方を変更
         */
        let p1 = P(content: "Red and center-aligned paragraph.")
        p1.prepStyle(name: p1.getTagName())
        p1.style.color.value = "red"
//        let css1 = CSS(tag: p1)
//        css1.color.value = "red"
//        p1.style = css1
        
        let bState = B(content: "center-aligned")
        let p2 = P(content: "Red and " + bState.tgStr() + " paragraph.")
        p2.prepStyle(name: p1.getTagName() + SPC + "*")
        p2.style.color.value = "blue"
//        let css = CSS(tag: p2, with: "*")
//        css.color.value = "blue"
//        p2.style = css
        
        let p3 = P(content: "この中身に適用されます")
        p3.setCls(cls: "sample")
        p3.prepStyle(name: p3.getTagName() + p3.getSelectorCls())
        p3.style.color.value = "red"
        p3.style.fontSize.value = "28px"
//        let css3 = CSS(name: p3.getTagName() + "." + p3.getTagCls())
//        css3.color.value = "red"
//        css3.fontSize.value = "28px"
//        p3.style = css3
        
        let p4 = DIV()
        p4.setCls(cls: "sample")
        p4.prepStyle(name: p4.getSelectorCls())
        p4.style.color.value = "yellow"
//        let css4 = CSS(cls: p4)
//        css4.color.value = "red"
//        p4.style = css4
        let st = "この中身には適用されません"
        p4.addCihld(child: st)
        
        body.addChildren(children: [p1,p2, p3,p4])
        
        head.addChild(child: style)
        html.addChild(child: head)
        html.addChild(child: body)
        doc.addMember(member: html)
        
        doc.press()
    }

    
}
