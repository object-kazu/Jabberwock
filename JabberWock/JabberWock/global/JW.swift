//
//  JW.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/03.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

let EXPORT_TEST_Dir = "/Users/shimizukazuyuki/Desktop/index/"
let EXPORT_TEST_File = "result.txt"


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
        self.openString = ""
        self.closeString = ""
    }

    
    func addContentAt(label:String, data:String) -> String{
        return LABEL_INSERT_START + label + LABEL_INSERT_END + data
    }
    
    override func assemble(){
        makeTag()
        makeResult()
    }
    
    override func makeResult() {
        
        templeteString = openString + content
        
        if !closeString.isEmpty {
            templeteString += closeString
        }
        initResutString()
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
        
        templeteString += openString + RET
        
        childAssemble()
        
        if !closeString.isEmpty {
            templeteString += closeString
        }
        
        // 最後のRETを取り除く
        templeteString = removeLastRET(str: templeteString)
        initResutString()
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
        if templeteString.contains(s.openString) && templeteString.contains(s.closeString) {
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
    func insertPress(_data_: [(label:String, data :String)]) {
        
        initResutString()
        insertData(_data_: _data_)
        removeAllLabel()
        pressCore(name: EXPORT_TEST_File, dist: EXPORT_TEST_Dir)
        
    }
    
    func insertPress(label:String, data :String){
        initResutString()
        insertData(lebel: label, Data: data)
        removeAllLabel()
        pressCore(name: EXPORT_TEST_File, dist: EXPORT_TEST_Dir)
    }

    
    
    override func press(name: String, dist : String) -> String{
        
        assemble()
        memberAssemble()
        removeAllLabel()
        applyStyle()
        pressCore(name: name, dist: dist)
        
        return resultString
    }
    
    func pressCore (name: String, dist : String) {
        
        // ドキュメントパス
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        // 保存するもの
        let fileObject = resultString
        // ファイル名
        let fileName = name
        // 保存する場所
        let filePath = documentsPath + fileName
        
        // 保存処理
        do {
            try fileObject.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Fail to write result at text file")
            
        }
        
        
        
        //file exist
        let fileManager = FileManager.default
        let path = dist + name
        
        if fileManager.fileExists(atPath: path){
            // remove file
            print("file remove!")
            removeFile(path: path)
        }
        
        // file move
        do{
            try fileManager.moveItem(atPath: filePath, toPath:path)
        } catch {
            assertionFailure("move error")
        }
    }

}

class JW{
    
    
    private var tagManager      : TagString = TagString()
    var openString              : String!
    var closeString             : String!
    
    var aData:(label:String, data :String)!
    var data: [(label:String, data :String)] = []
    
    var variableLabel            : String!
    var vLabel                   : String {
        get {
            return LABEL_INSERT_START + variableLabel + LABEL_INSERT_END
        }
    }

    var templeteString  : String    = "" // Labelによる書き換え前のString
    var resultString    : String    = "" // Labelによる書き換え後の最終String
    
    var memberString: [String]      = []
    

    // 自分のClass名を得る
    func callClassName() -> String {
        return String(describing: self).components(separatedBy: ".").last!
    }

    
    
    // remove last \n
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
    
    //export string
    func tgStr () -> String {
        assemble()
        return templeteString
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
        tagManager.lang = lang
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
    
    
    
    /*
     press後、変更可能とする仕組み
     ================================================================================
     set)
     => let p1 = P()
     => p1.content = "insert data: " + V("j") + "is made for" + V("i")
     
     => press
     
     <p> insert data: ##LABELSTART##j##LABELSTART## is made for ##LABELSTART##i##LABELSTART##<p>
     
     => insertPress([(label:String,data:String)])
     
     <p> insert data: hogehoge is made for fofofofofofo<p>
     
     
     ================================================================================
     
     
     
     
     */
    
    func V(label:String) -> String {
        self.variableLabel = label
        return self.vLabel
    }

    // templeteStringにDataを挿入してresultStringに更新する
    /*
     
     => assemble // templeteStringとresultStringを用意する
     
     == temprateString ==
     <p> ##LABEL## conten ## LABEL## </p>
     <p> ##LABEL## conten1 ## LABEL## </p>
     
     == templeteString ==
     <p> ##LABEL## conten ## LABEL## </p>
     <p> ##LABEL## conten1 ## LABEL## </p>

     => initResultString　// resultStringを初期化し直す
     
     == temprateString ==
     <p> ##LABEL## conten ## LABEL## </p>
     <p> ##LABEL## conten1 ## LABEL## </p>
     
     == templeteString ==
     <p> ##LABEL## conten ## LABEL## </p>
     <p> ##LABEL## conten1 ## LABEL## </p>

     
     => insertPress(label: conten, Data: "hellow")
     
     == temprateString ==
     <p> ##LABEL## conten ## LABEL## </p>
     <p> ##LABEL## conten1 ## LABEL## </p>
     
     == resultString ==
     <p> ##LABEL## conten ## LABEL##hellow </p>
     <p> ##LABEL## conten1 ## LABEL## </p>
     
     => removeLabel() // 全てのラベルを削除してresultStringとして出力する
     <p> hellow </p>
     <p> </p>
     
     
     
     */
//    func insertPress(_data_: [(label:String, data :String)]) {
//        
//        initResutString()
//        insertData(_data_: _data_)
//        removeAllLabel()
//        
//    }
//    
//    func insertPress(label:String, data :String){
//        initResutString()
//        insertData(lebel: label, Data: data)
//        removeAllLabel()
//    }
    
    func initResutString () {
        // templeteString -> keep
        // resultString -> copy templeteString
        resultString = ""
        resultString = templeteString
    }
    
    fileprivate func insertData (_data_: [(label:String, data :String)]) {
        for d in _data_ {
            insertData(lebel: d.label, Data: d.data)
        }
    }
    
    fileprivate func insertData (lebel: String, Data :String) {
        let targetString = vLabel
        let dataPlusTargetString = targetString + Data
        resultString = resultString.replacingOccurrences(of: targetString, with: dataPlusTargetString)
    }
    
    func removeAllLabel () {
        let a = resultString.pregReplace(pattern: "##LABELSTART##.*?##LABELEND##", with: "")
        resultString = a
    }
    
    
    
    // tagの変更時には必ず呼び出しアップデート
    func makeTag() {
        openString = tagManager.openString()
        closeString = tagManager.closeString()
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

    
    
    func assemble(){}
    func makeResult(){}
    
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
    func press(name: String, dist : String) ->String{return ""}
    
    @discardableResult
    func press () -> String  {
       return self.press(name: EXPORT_TEST_File, dist: EXPORT_TEST_Dir)
    }
    
    
    func removeFile(path:String){
        let fileManager = FileManager.default

        do {
            try fileManager.removeItem(atPath: path)
            print("Removal successful")
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
 }
