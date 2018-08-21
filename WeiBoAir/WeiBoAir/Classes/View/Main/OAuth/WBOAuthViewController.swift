//
//  WBOAuthViewController.swift
//  WeiBoAir
//
//  Created by li on 2018/8/20.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

/// 微博OAuth 授权处理器
class WBOAuthViewController: UIViewController {

    private lazy var webView = UIWebView()
    
    override func loadView() {
        view = webView
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontSize: 16, target: self, action: #selector(close), isBack: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充",  fontSize: 16, target: self, action: #selector(autofill), isBack: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let reqUrl = "https://api.weibo.com/oauth2/authorize?client_id=\(WBappKey)&redirect_uri=\(WBRedirectURI)"
        guard let url = URL(string: reqUrl) else {
            return
        }
        webView.loadRequest(URLRequest(url: url))
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func autofill() {
        let js = "document.getElementById('userId').value='\(WBUserName)';" + "document.getElementById('passwd').value='\(WBPwd)';"
        let rev =  webView.stringByEvaluatingJavaScript(from: js)
        print(rev)
    }
}


extension WBOAuthViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("应该打开的路径 - \(request.url)")
        if request.url?.absoluteString.hasPrefix(WBRedirectURI) == false {
            return true
        }
        // 没有code= 授权失败
        if request.url?.query?.hasPrefix("code=") == false {
            close()
            return false
        }
        //得到授权码
        let code = request.url?.getQueryStringParameter(param: "code")
        print("code = \(code)")
        
        return true
    }
}
