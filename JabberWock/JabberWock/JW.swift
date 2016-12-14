//
//  JW.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/03.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation


let RET: String = "\n"
let TAB: String = "\t"
let SPC: String = " "


class JW {
    var openString      : String = ""
    var closeString     : String = ""
    
    var resultString: String   = ""
    var childString : [String] = []
    
    func addMember () {
        self.assemble()
    }
    
    func addMember (member: JW){
        resultString += RET
        member.assemble()
        resultString += member.resultString
    }
    
    // add tab for indent
    func addTab (str: String) -> String {
        return TAB + str
    }
    
    func addChild (child : JW){
        child.assemble()
        self.addCihld(child: child.resultString)
    }
    
    func addCihld (child: String) {
        let t = child.replacingOccurrences(of: RET, with: RET + TAB)
        childString.append(addTab(str: t))
    }

    func assemble() {}
        
    func assembleCore() {
        resultString += openString
        resultString += RET
        
        if childString.count > 0 {
            for str in childString {
                resultString += str
                resultString += RET
            }
        }
       
        if closeString != "" {
            resultString += closeString
        }
    }
    
    // ファイルに書き出す
    func press ()  {
        
        // ドキュメントパス
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        // 保存するもの
        let fileObject = resultString
        // ファイル名
        let fileName = "result.txt"
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
        let path = "/Users/shimizukazuyuki/Desktop/result.txt"
        
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
