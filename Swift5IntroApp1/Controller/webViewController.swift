//
//  webViewController.swift
//  Swift5IntroApp1
//
//  Created by output. on 2020/03/28.
//  Copyright © 2020 tomoaki narita. All rights reserved.
//

import UIKit
//WebKitをimport
import WebKit

//WKWebViewクラスを使いたいのでWKUIDelegateプロトコルを追加
class WebViewController: UIViewController,WKUIDelegate {
    
    //WKWebViewクラスをwebView(変数)に入れる
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //webViewのサイズを決める
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
        
        //webViewをViewのサブビューにする
        view.addSubview(webView)
        
        //Page1ViewControllerでアプリ内に保存したキー値("url")をurlStringに入れる
        let urlString = UserDefaults.standard.object(forKey: "url")
        
        //urlStringに入っている値はAny型で保存しているので、String型で取り出してから、webViewに表示するにはまずURL型にキャストする
        let url = URL(string: urlString as! String)
        
        //URL型にキャストした値をURLRequest型にキャストしてrequestに入れる
        let request = URLRequest(url: url!)
        
        //requestをロードする
        webView.load(request)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
