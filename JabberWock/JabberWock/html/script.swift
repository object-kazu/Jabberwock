//
//  script.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2017/01/16.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation



class SCRIPT : JWMulti {
    
    var fileName: String        = ""
    var loadedStrings: [String] = []
    
    /*
     （注意！）外部ファイルのディレクトリはプロジェクト内部
     外部のファイルを読み込んで、指定されたファイルに追加(merge)する
     ＝＞test.js (= fileName)
     document.write('this is test');
     
     => test2.js (= import file)
     document.write('this is test');
     
     =>loadFile(file:"test2.js")
     ＝＞test.js (= fileName)
     document.write('this is test');
     document.write('this is test');
     
     */
    
    override init() {
        super.init()
        
    }
    
    init(type: String, name:String, path:String) {
        super.init()
        self.initialize()
        self.tagManager.jsFileName = name
        self.tagManager.jsPath = path
        self.tagManager.jsType = type
        
    }
    
    init(type:String) {
        super.init()
        self.initialize()
        self.tagManager.jsType = type
    }
    
    init(name:String){
        super.init()
        self.initialize()
        self.tagManager.jsFileName = name
    }

    init(name:String, path: String){
        super.init()
        self.initialize()
        self.tagManager.jsFileName = name
        self.tagManager.jsPath = path
    }

    
    private func initialize () {
        setName(name:"script")
    }
    
    func loadFile(jsFile:String){
        guard let bundle = Bundle.main.path(forResource: jsFile, ofType: "js") else{
            assertionFailure("error at path expression")
            return
        }
        
        var textArray: [String] = []
        do {
            let jsCode = try String(contentsOfFile: bundle, encoding: String.Encoding.utf8)
            let lineChange = jsCode.replacingOccurrences(of: "\r", with: "\n")
            textArray = lineChange.components(separatedBy: "\n")
        } catch {
            print("エラー")
        }
        self.loadedStrings.append(contentsOf: textArray)

    }
    
    private func addLoadedString() {
        self.childString.append(contentsOf: loadedStrings)
    }
    
    override func assemble() {
        initialize()
        makeTag()
        
        // loaded js file strings insert
        if loadedStrings.count > 0 {
            addLoadedString()
            loadedStrings = []
        }
        
        makeResult()
        
    }
    
    
    /// add child
    /*
        srcの指定有無によってaddChildの挙動を変更したいので、overrideする
     */
    override func addChild (child : JWObject){
        /// script tagはJWObjecをとらない
        assertionFailure("script tag do not have JWObject")
    }
    
    override  func addChildren (children : [JWObject]){
        /// script tagはJWObjecをとらない
        assertionFailure("script tag do not have JWObject")
    }
    
}
