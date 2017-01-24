//
//  JW.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/03.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation



/*
 
 <tag> content </tag>

 <member> xxxx </member>
 <member> xxxx </member>
 <member> xxxx </member>
 
 
 */

class JWSingle: JWObject {
    
    var content :  String  = ""

    override init() {
        super.init()
        initilizer()

    }

    init(content: String) {
        super.init()
        self.initilizer()
        self.content = content
    }
    
    func initilizer () {
        tagManager.initialize()
    }

    
    func addContentAt(label:String, data:String) -> String{
        return LABEL_INSERT_START + label + LABEL_INSERT_END + data
    }
    
    override func assemble(){
        makeTag()
        makeResult()
    }
    
    override func makeResult() {
        templeteString = tagManager.tempOpenString + content
       
        if !tagManager.tempCloseString.isEmpty {
            templeteString += tagManager.tempCloseString
        }
    }
    
}

/*
 
 <tag>
    child
    child
    child
    child
 </tag>

 <member> xxxx </member>
 <member> xxxx </member>
 <member> xxxx </member>

 
 */

class JWMulti: JWObject {
    
    var childString: [String] = []
    
    // add child
    func addChild (child : JWObject){
        
        //js
        importJSParameters(child: child)
        // html
        child.assemble()
        self.addCihld(child: child.templeteString)
        
        // css
        if child.styleArray.count > 0{
            styleArray.append(contentsOf: child.styleArray)
        }
        if child.style != nil{
            styleArray.append(child.style)
        }
        
    }
    
    func addChildren (children : [JWObject]){
        
        for c: JWObject in children {
            addChild(child: c)
        }
    }
    
    
    func addCihld (child: String) {
        
        let t = child.replacingOccurrences(of: RET, with: RET + TAB)
        childString.append(t)
    }

    
    override func assemble() {
        makeTag()
        makeResult()
    }
    
    override func makeResult() {
        templeteString += tagManager.tempOpenString + RET
        
        childAssemble()
        
        if !tagManager.tempCloseString.isEmpty {
            templeteString += tagManager.tempCloseString
        }
        
        // 最後のRETを取り除く
        templeteString = removeLastRET(str: templeteString)
    }
    
    func childAssemble () {
        for str in childString {
            templeteString += TAB + str
            templeteString += TAB + RET
           }
    }

    
    
}

 // 今後、基底クラスのインターフェイスとする
class JWObject : JWCSS {
    
}
// class JWCSSScript : JWCSS {} ...

class JWCSS: JW { // add css functions
    
    var style :CSS!
    var styleArray : [CSS]  = []
    var styleString: String = ""
    private var nameList :[String] = [] // 重複判定に利用
    
    

    func prepStyle(name: String) {
        style = CSS(name: name)
    }
    func prepStyle(property: CSS.property){
        style = CSS(property: property)
    }
    
    func styleStringInit () {
        styleString = "" // initilize
    }
    
    private func styleAssemble () {
        nameList = []
        var tempStyle : [CSS] = []
        if style != nil{
            tempStyle.append( style )
        }
        tempStyle.append(contentsOf: styleArray)
        
        for sty in tempStyle {
            /// スタイルがない（｛｝のみ）なら標示しない
            if sty.Str().isEmpty {
                continue
            }
            
            if isSameCSSName(name: sty.cssName) {
                continue
            }
            /// 同じ名前のスタイルは書き込まない（重複書き込み禁止）
            nameList.append(sty.cssName)
            styleString += sty.Str()
            styleString += RET
            
            
        }
        
        styleString = removeLastRET(str: styleString)
        
    }
    
    
    private func isSameCSSName (name: String) -> Bool {
        for n in nameList {
            if n == name {
                return true
            }
        }
        
        return false
    }
    

    func styleStr () -> String {
        styleStringInit()
        styleAssemble()
        return styleString
    }

    
    func applyStyle() {
        styleAssemble()
        
        ///検索のためにStyle tag生成
        let s = STYLE()
        s.makeTag()
        if templeteString.contains(s.tagManager.tempOpenString) && templeteString.contains(s.tagManager.tempCloseString) {
            // insert tab
            let tn = getTabNumber(testStr: templeteString, targetStr: STYLE_CONTENT)
            let tabedString = addTab(str: styleString, tabMax: tn)
            
            // replace text
            // 余分なTabを削除しておく
            var target = ""
            for _ in 0..<tn {
                target += TAB
            }
            target += STYLE_CONTENT
            templeteString = templeteString.replacingOccurrences(of: target, with: STYLE_CONTENT) // TAB + TAB + STYLE_CONTENT -> STYLE_CONTENT
            templeteString = templeteString.replacingOccurrences(of: STYLE_CONTENT, with: tabedString)
        }
    }
    
    
    // add member
    func addMember(member:String)  {
    
        memberString.append(member)
    }

    func addMember (member: JWObject){
        // js
        importJSParameters(child: member)
        
        // html
        member.assemble()
        addMember(member: member.templeteString)
        
        // css
        if member.styleArray.count > 0{
            styleArray.append(contentsOf: member.styleArray)
        }
        if member.style != nil {
            styleArray.append(member.style)
        }
        
    }
    func addMembers (members: [JWObject]) {
        for m: JWObject in members {
            m.addMember(member: m)
        }
    }
    
    // press
    
    override func prepTempString() {
        assemble()
        memberAssemble()
        applyStyle()
    }
}

class JW{
    
    var tagManager      : TagString = TagString()
    private var openString              : String!
    private var closeString             : String!
    
    var aData:(label:String, data :String)!
    var data: [(label:String, data :String)] = []
    
    var templeteString  : String    = "" // Labelによる書き換え前のString
    var pressTreatment  : Press!
    
    var memberString: [String]      = []
    

    // 自分のClass名を得る
    func callClassName() -> String {
        return String(describing: self).components(separatedBy: ".").last!
    }

    
    
    // remove charactor
    func removeLastRET (str: String) -> String {
        if str.hasSuffix("\n") {
            return str.substring(to: str.index(before: str.endIndex))
        }
        return str
    }
    func removeLastTAB (str: String) -> String {
        if str.hasSuffix("\t") {
            return str.substring(to: str.index(before: str.endIndex))
        }
        return str
    }
    
    func removeHeadTAB (str:String) -> String{
        if str.hasPrefix("\t"){
            return str.substring(from: str.index(after: str.startIndex))
        }
        return str
    }
    
    //export string
    func tgStr () -> String {
        assemble()
        return templeteString
    }

    //js
    func importJSParameters (child:JWObject) {
        if child.tagManager.isJsAvailable() {
            self.tagManager.jsFileName  = child.tagManager.jsFileName
            self.tagManager.jsType      = child.tagManager.jsType
            self.tagManager.jsPath      = child.tagManager.jsPath
        }
        
    }
    
    // tag
    func isBRTag (single: Bool) {
        tagManager.isBRTag = single
    }
    func isSingleTag (single: Bool) {
        tagManager.isSingleTag = single
    }
    
    func setID(id:String) {
        tagManager.id = id
    }
    
    func setCls(cls:String) {
        tagManager.cls = cls
    }
    func setName(name:String) {
        tagManager.name = name
    }
    func setLang(lang:LANG) {
        tagManager.attr.add(lang: lang)
    }
    func tagName() -> String {
        return tagManager.name
    }
    func tagID() -> String {
        if tagManager.id.isEmpty {
            assertionFailure("set id")
        }
        return tagManager.id
    }
    func selectorID () -> String {
        return "#" + tagID()
    }
    
    func tagCls() -> String {
        if tagManager.cls.isEmpty {
            assertionFailure("set cls")
        }
        return tagManager.cls
    }

    func selectorCls () -> String {
        return "." + tagCls()
    }
    
    func makeTag() {
        tagManager.openString(spec: "")
        tagManager.closeString(spec: "")
    }
    
    // tab揃え
    func tabNumber (str: String) -> Int {
        let last = removeLastTAB(str: str) //余分なTabを除く
        let a = last.components(separatedBy: "\t")
        return a.count - 1
    }
    
    
    
    func addTab (str: String, tabMax : Int) -> String {
        var ans = ""
        let l = str.lines
        for e:String in l {
            let tn = tabNumber(str: e)
            let a = tabMax - tn
            let s = addheadTab(str: e, num: a)
            ans += s
            ans += "\n"
        }
        
        return ans
    }
    
    func addheadTab (str: String, num:Int) -> String {
        var t = ""
        for _ in 0..<num {
            t += "\t"
        }
        t += str
        return t
    }
    
    func getTabNumber (testStr:String, targetStr: String ) -> Int {
        let lin = testStr.lines
        for l in lin {
            if l.contains(targetStr) {
                return tabNumber(str: l)
            }
        }
        return 0
    }
    
    func getTabMax (testStr:String) -> Int {
        var max = 0
        let lin = testStr.lines
        for l in lin {
            let n = tabNumber(str: l)
            if n > max {
                max = n
            }
        }
        return max
        
    }

    
    func prepTempString()  {
        assemble()
        memberAssemble()
    }
    
    func assemble(){
        makeTag()
        makeResult()
    }
    
    func makeResult(){
        templeteString += tagManager.tempOpenString + RET
        
        if !tagManager.tempCloseString.isEmpty {
            templeteString += tagManager.tempCloseString
        }
        
        // 最後のRETを取り除く
        templeteString = removeLastRET(str: templeteString)
    }
    
    func memberAssemble () {
        
        if memberString.count > 0 {
            templeteString += RET
            
            var m: String = ""
            for t: String in memberString {
                m += t
                m += RET
            }
            
            templeteString += m
        }
    }
    
    // resultStringをファイルに書き出す
    @discardableResult
    func press(name: String, dist : String) -> String{
        self.pressTreatment = Press()   // prep templeteString
        prepTempString()                // make templeteString
        
        if self.tagManager.isJsAvailable() {
            if self.tagManager.isNeedJsSrc() {
                // prep for js
                // <script>　と<その他>を分離
                // <その他>を別ファイルに書き出す
                // ＜script＞を通常通り書き出す
                let a = enumerateLine(target: self.templeteString)
                let ans = self.tagManager.extranctBetweenScriptTag(target: a)
                var b : [String] = []
                for t in ans.extract {
                    b.append(removeHeadTAB(str: t))
                }
                self.templeteString = b.joined(separator: "\n")
                
                // export to js file
                self.pressTreatment.templeteString = self.templeteString
                self.pressTreatment.initResutString()               // templeteString -> resultString
                self.pressTreatment.removeAllLabel()                // remove label string
                let tempName = self.tagManager.jsFileName
                let tempDir = self.tagManager.jsPath
                self.pressTreatment.core(name: tempName, dist: tempDir)    // press resultString

                // prep for html and css
                self.templeteString = ans.scriptTag.joined(separator: "\n")
                
                
            }else{
                //通常のTagと同じ処理
            }
            
        }
        
        self.pressTreatment.templeteString = self.templeteString
        self.pressTreatment.initResutString()               // templeteString -> resultString
        self.pressTreatment.removeAllLabel()                // remove label string
        self.pressTreatment.core(name: name, dist: dist)    // press resultString
        

        return self.pressTreatment.resultString
    }
    
    @discardableResult
    func press () -> String {
        return self.press(name: EXPORT_TEST_File, dist: EXPORT_TEST_Dir)
    }
    
    @discardableResult
    func insertPress(_data_: [(label:String, data :String)]) -> String {
        return self.pressTreatment.withInsert(_data_: _data_)
    }
    
    @discardableResult
    func insertPress(label:String, data:String) -> String {
        return self.pressTreatment.withInsert(label: label, data: data)
    }
    
}

