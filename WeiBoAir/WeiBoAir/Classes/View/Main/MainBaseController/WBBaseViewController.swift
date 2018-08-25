//
//  WBBaseViewController.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

//    lazy var navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.lp_screenWidth, height: 64))
    
    //lazy var isLogin: Bool = false
    
    var navigationBar: UINavigationBar?
    
    lazy var navigationItem2: UINavigationItem = UINavigationItem()
    
    var visitorInfoDic: [String:String]?
    
    
    var tableView: UITableView?
    // 刷新控件
    var refreshControl: UIRefreshControl?
    // 上拉刷新标记
    lazy var isPullup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(userLoginSuccess), name: NSNotification.Name(rawValue: WBUserLoginSuccessNotification), object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension WBBaseViewController {
    @objc func setupUI() {
        print("Base View setupUI")
        //view.backgroundColor = .random
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        // 取消自动缩进
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        if WBNetworkManager.shared.userLogin {
            setupTableView()
            loadData()
        } else {
           setupVisitorView()
        }
    }
    

    @objc func loadData() {
        
    }
}

// MARK: - NavigatioinBar
extension WBBaseViewController {
    private func setupNavigationBar() {
        
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 64))
        navigationBar!.contentMode = .bottom
        view.addSubview(navigationBar!)
        navigationBar!.items = [navigationItem]
        //设置 navBar 的渲染颜色 发白的时候用
        //navigationBar?.barTintColor = UIColor(rgb: 0xF6F6F6)
        //设置navBar 的标题Title字体颜色
        navigationBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        //设置系统按钮的文字渲染颜色  只对系统.plain 的方法有效
        //navigationBar?.tintColor = UIColor.orange
        
        navigationBar?.translatesAutoresizingMaskIntoConstraints = false
        navigationBar?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationBar?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        if #available(iOS 11.0, *) {
            print("ios 11 version.")
            navigationBar?.heightAnchor.constraint(equalToConstant: 44).isActive = true
            navigationBar?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            navigationBar?.heightAnchor.constraint(equalToConstant: 64).isActive = true
            navigationBar?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
        navigationBar?.installBlurEffect()
        //navigationBar?.installBlurEffect()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
}


extension WBBaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        //return true
        return (self.navigationController?.childViewControllers.count ?? 0) > 1
    }
}


// MARK: - AddSubView
extension WBBaseViewController {
    private func addView(subView: UIView) {
        view.addSubview(subView)
        
        subView.translatesAutoresizingMaskIntoConstraints = false
        if let nav = navigationBar {
            subView.topAnchor.constraint(equalTo: nav.bottomAnchor).isActive = true
        } else {
            subView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
        subView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        subView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if let tab = tabBarController?.tabBar, !hidesBottomBarWhenPushed {
            //tableView!.bottomAnchor.constraint(equalTo: tab.topAnchor).isActive = true
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tab.bounds.height).isActive = true
        } else {
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
    }
}


// MARK: -- TabelVew
extension WBBaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // 1. 判断indexPath 是否是最后一行
        // (indexPath.selection(最大) / indexPath.row(最后一行))
        // 1> row
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        
        // 行数
        let count = tableView.numberOfRows(inSection: section)
        // 如果是最后一行，同时没有上拉刷新
        if (row == (count - 1)) && !isPullup {
            print("上拉刷新")
            isPullup = true
            loadData()
        }
    }
    
    // MARK: setupTableView
    @objc func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        //view.insertSubview(tableView!, belowSubview: navigationBar!)
        addView(subView: tableView!)
        //tableView!.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        // 设置内容缩进
        //        tableView?.contentInset = UIEdgeInsets(top: navigationBar?.bounds.height ?? 0,
        //                                               left: 0,
        //                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
        //                                               right: 0)
        
        //        tableView?.contentInset = UIEdgeInsets(top: 0,
        //                                               left: 0,
        //                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
        //                                               right: 0)
        
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        
        // 添加监听刷新方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
}


// MARK: - VisitorView
extension WBBaseViewController {
    // 登录成功处理
    @objc func userLoginSuccess(n: Notification) {
        print("登录成功\(n)")
        //
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
        // 因为会 下面 reloadVIew会两次注册Notifiction。所以先移除
        NotificationCenter.default.removeObserver(self)
        // 更新 UI 将访客视图转换为登录视图
        // 需要重新设置 view
        // 在访问view的getter时，如果 view == nil ， 会调用loadview -> viewDidLoad
        view = nil
        
    }
    
    @objc func setupVisitorView() {
        let v = WBVisitorView(frame: view.bounds)
        
        addView(subView: v)
        v.visitorInfo = visitorInfoDic
        v.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        v.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", target: self, action: #selector(register))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", target: self, action: #selector(login))
        
        let registerButton: UIButton = UIButton.lp_textButton(title: "注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: .black, backgroundImgName: "")
        let loginButton: UIButton = UIButton.lp_textButton(title: "登录", fontSize: 16, normalColor: UIColor.orange, highlightedColor: .black, backgroundImgName: "")
        
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: registerButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: loginButton)
    }
    
    
    @objc func login() {
        print(#function)
        print("login")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
        
    }
    
    @objc func register() {
        print(#function)
        print("register")
        //isLogin = false
    }
}






