//
//  ViewController.swift
//  JabberWock
//
//  Created by 清水 一征 on 2016/12/01.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        jsLoad()
        
        // パスを取得する
        // ドキュメントパス
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

        // ファイル名
        let fileName = EXPORT_TEST_File
//        // 保存する場所
        let path = documentsPath + "/" + fileName
        let url = NSURL(string: path)!
        
        // リクエストを生成する
        let request = NSURLRequest(url: url as URL)
        
        // リクエストを投げる
        webView.loadRequest(request as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ロード時にインジケータをまわす
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("indicator on")
    }
    
    // ロード完了でインジケータ非表示
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("indicator off")
    }

    // js load
    func jsLoad(){
        let path = Bundle.main.path(forResource: "jquery-3.1.1.min", ofType: "js")
        let jsCode = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        webView.stringByEvaluatingJavaScript(from: jsCode!)
    }

    
}

