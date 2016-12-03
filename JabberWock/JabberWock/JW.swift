//
//  JW.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/03.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class JW {
    
    // ファイルに書き出す
    func press (text: String)  {
        
        // ドキュメントパス
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        // 保存するもの
        let fileObject = text
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
        
        // file move
        let fileManager = FileManager.default //NSFileManager.defaultManager()

        do{
            try fileManager.moveItem(atPath: filePath, toPath: "/Users/shimizukazuyuki/Desktop/sample.txt")
        } catch {
            assertionFailure("move error")
        }
    }
 }
