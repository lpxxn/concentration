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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}
