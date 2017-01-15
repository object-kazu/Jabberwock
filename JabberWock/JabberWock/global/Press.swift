//
//  Press.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/15.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation


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

class Press{
    
    var templeteString  : String!           // Labelによる書き換え前のString
    var resultString    : String    = ""    // Labelによる書き換え後の最終String
    
    func initResutString () {
        /// templeteString -> keep
        /// resultString -> copy templeteString
        resultString = ""
        resultString = templeteString
    }
    
    
    func insertData (_data_: [(label:String, data :String)]) {
        for d in _data_ {
            insertData(label: d.label, Data: d.data)
        }
    }
    
    func insertData (label: String, Data :String) {
        let targetString = V(label: label)
        let dataPlusTargetString = targetString + Data
        resultString = resultString.replacingOccurrences(of: targetString, with: dataPlusTargetString)
    }
    
    func removeAllLabel () {
        let a = resultString.pregReplace(pattern: "##LABELSTART##.*?##LABELEND##", with: "")
        resultString = a
    }
    
    @discardableResult
    func withInsert(_data_: [(label:String, data :String)]) -> String {
        
        initResutString()
        insertData(_data_: _data_)
        removeAllLabel()
        core(name: EXPORT_TEST_File, dist: EXPORT_TEST_Dir)
        
        return resultString
        
    }
    
    @discardableResult
    func withInsert(label:String, data :String) -> String{
        initResutString()
        insertData(label: label, Data: data)
        removeAllLabel()
        core(name: EXPORT_TEST_File, dist: EXPORT_TEST_Dir)
        
        return resultString
    }
    
    // templateString -> resultString -> export
    @discardableResult
    func core(name: String, dist : String) -> String{
        
        exportResult(name: name, dist: dist)
        return resultString
    }
    
    func exportResult (name: String, dist : String) {
        
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
