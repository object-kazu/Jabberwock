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


class JW {
    var isMultiLine     : Bool!
    var openString      : String = ""
    var closeString     : String = ""
    
    var resultString: String   = ""
    var childString : [String] = []
    
    var content :  String  = ""

    
    //export string
    func tgStr () -> String {
        assemble()
        return resultString
    }
    
    //insert content
    func insertContent () {
        childString.append(content)
    }
    
    
    // add member
    func addMember(member:String)  {
        resultString += member
        resultString += RET
        
    }
    
    func addMember (member: JW){
        member.assemble()
        addMember(member: member.resultString)
        
    }
    
    // add tab for indent
    func addTab (str: String) -> String {
        return TAB + str
    }
    
    
    // add child
    func addChild (child : JW){
        child.assemble()
        self.addCihld(child: child.resultString)
    }
    
    func addCihld (child: String) {
        let t = child.replacingOccurrences(of: RET, with: RET + TAB)
        childString.append(addTab(str: t))
    }

    func assemble(){
        makeResult()
    }
    
    func makeResult() {

        resultString += openString

        if isMultiLine! {
                resultString += RET
        }
        
        if !isMultiLine! {
            childAssemble()
        }else{
            childrenAssemble()
            //resultString += RET
        }
        
        if closeString != NO_CLOSETAG {
            resultString += closeString
        }

    }
        

    
    private func childrenAssemble () {
        for str in childString {
            resultString += str
            resultString += RET
           }

    }
    
    private func childAssemble () {
        if childString.count != 1 {
            return
        }
        resultString += childString.first!
    }
    
    // ファイルに書き出す
    func press(name: String, dist : String){
        
        assemble()
        
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
