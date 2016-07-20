//
//  ViewController.swift
//  JabberWockSample1
//
//  Created by kazuyuki shimizu on 2016/06/16.
//  Copyright © 2016年 Momiji-mac.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        write("shimizu")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func write (text:String) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let cacheKey = "/test/1"
        let fileName = "test.txt"
        
        // ディレクトリのパス
        let folderPath = documentsPath + cacheKey
        //　ファイルのパス
        let filePath = documentsPath+cacheKey + "/" + fileName
        
        //ディレクトリとファイルの有無を調べる
        let fileManager = NSFileManager.defaultManager()
        let isDir : ObjCBool = false
        
        
        print(filePath)
        
        //ディレクトリが存在しない場合に、ディレクトリを作成する

        if !isDir {
            do{
                try fileManager.createDirectoryAtPath(folderPath, withIntermediateDirectories: true, attributes: nil)
                
            } catch {
                // fail
                assertionFailure("mkdir error")
            }
        }
        
        
        // 保存するもの
        let fileObject = text
        
        // 保存処理
        do {
            try fileObject.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        } catch {
            // Failed to write file
            assertionFailure("save error")
        }

        do{
            try fileManager.moveItemAtPath(filePath, toPath: "/Users/shimizukazuyuki/Desktop/sample.txt")
        } catch {
            assertionFailure("move error")
        }
        
    }
    
}

