//
//  WBOAuthViewController.swift
//  WeiBoAir
//
//  Created by li on 2018/8/20.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit
import SVProgressHUD
/// 微博OAuth 授权处理器
class WBOAuthViewController: UIViewController {

    private lazy var webView = UIWebView()
    
    override func loadView() {
        view = webView
        view.backgroundColor = #colorLiteral(red: 0.8901960784, green: 0.9019607843, blue: 0.9098039216, alpha: 1)
        
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", fontSize: 16, target: self, action: #selector(close), isBack: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充",  fontSize: 16, target: self, action: #selector(autofill), isBack: false)
        webView.scrollView.isScrollEnabled = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if #available(iOS 11.0, *) {
//            webView.translatesAutoresizingMaskIntoConstraints = false
//            //let margins = view.layoutMarginsGuide
//            let guide = view.safeAreaLayoutGuide
//            NSLayoutConstraint.activate([
////                    webView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////                    webView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                    webView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
//                    //guide.bottomAnchor.constraintEqualToSystemSpacingBelow(webView.bottomAnchor, multiplier: 1.0)
//                    guide.bottomAnchor.constraint(equalTo: webView.bottomAnchor, constant: 1.0)
//
////                webView.widthAnchor.constraint(equalTo: view.widthAnchor),
////                //webView.topAnchor.constraint(equalTo: margins.topAnchor),
////                webView.topAnchor.constraint(equalTo: view.topAnchor),
////                webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34)
//                ])
//        }
//        if #available(iOS 11.0, *) {
//            webView.translatesAutoresizingMaskIntoConstraints = false
//            // iconView
//
//            webView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            webView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//            webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//            webView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//            let window = UIApplication.shared.keyWindow
//            let bottomPadding = window?.safeAreaInsets.bottom ?? 0
//            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomPadding).isActive = true
//        }
        
        // Do any additional setup after loading the view.
        let reqUrl = "https://api.weibo.com/oauth2/authorize?client_id=\(WBappKey)&redirect_uri=\(WBRedirectURI)"
        guard let url = URL(string: reqUrl) else {
            return
        }
        DispatchQueue.main.async {
             self.webView.loadRequest(URLRequest(url: url))
        }
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc private func close() {
        SVProgressHUD.dismiss()
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
        // SVProgressHUD.showInfo(withStatus: "请求失败testing")
        //得到授权码
        guard let code = request.url?.getQueryStringParameter(param: "code") else {
            close()
            return false
        }
        print("code = \(code)")
        WBNetworkManager.shared.loadAccessToken(code: code) { (isSuccess) in
            if isSuccess {
                
                //close()
            } else {
                SVProgressHUD.showInfo(withStatus: "请求失败")
            }
        }
        
        return false
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
}
