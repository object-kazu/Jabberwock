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

class JWSingle: JW {
    
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

    override func assemble(){
        makeTag()
        makeResult()
    }
    
    override func makeResult() {
        
        resultString = openString + content
        
        if closeString != "" {
            resultString += closeString
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

class JWMulti: JW {
    
    var childString: [String] = []
    
    // add child
    func addChild (child : JW){
        child.assemble()
        self.addCihld(child: child.resultString)
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
        
        resultString += openString + RET
        
        childAssemble()
        
        if closeString != "" {
            resultString += closeString
        }
        
        // 最後のRETを取り除く
        resultString = removeLastRET(str: resultString)
        
        
    }
    
    func childAssemble () {
        for str in childString {
            resultString += TAB + str
            resultString += TAB + RET
           }
    }

    
    
}

class JW {
    
    private var tagManager      : TagString = TagString()
    var openString              : String!
    var closeString             : String!
    
    var resultString    : String    = ""
    var memberString: [String]      = []
    

    // remove last \n
    func removeLastRET (str: String) -> String {
        if str.hasSuffix("\n") {
            return str.substring(to: str.index(before: str.endIndex))
        }
        return str
    }
    
    //export string
    func tgStr () -> String {
        assemble()
        return resultString
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
    
    
    // tagの変更時には必ず呼び出しアップデート
    func makeTag() {
        openString = tagManager.openString()
        closeString = tagManager.closeString()
    }
    
    // add member
    func addMember(member:String)  {
        memberString.append(member)
    }
    
    func addMember (member: JW){
        member.assemble()
        addMember(member: member.resultString)
        
    }
    func addMember (members: [JW]) {
        for m: JW in members {
            m.addMember(member: m)
        }
    }
    
    
    func assemble(){}
    func makeResult(){}
    
    func memberAssemble () {
        
        if memberString.count > 0 {
            resultString += RET
            
            var m: String = ""
            for t: String in memberString {
                m += t
                m += RET
            }
            
            resultString += m
        }
    }
    
    // ファイルに書き出す
    func press(name: String, dist : String){
        
        assemble()
        memberAssemble()
        
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
    
    
    
    func press ()  {
        self.press(name: EXPORT_TEST_File, dist: EXPORT_TEST_Dir)
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
