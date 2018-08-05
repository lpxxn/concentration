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
    
    var navigationBar: UINavigationBar?
    
    lazy var navigationItem2: UINavigationItem = UINavigationItem()
    
    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        setupUI()

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
        view.backgroundColor = .random
        
        // 取消自动缩进
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        setupTableView()
        loadData()
    }
    
    private func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        //view.insertSubview(tableView!, belowSubview: navigationBar!)
        //
        view.addSubview(tableView!)
        
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        if let nav = navigationBar {
            tableView!.topAnchor.constraint(equalTo: nav.bottomAnchor).isActive = true
        }
        tableView!.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if let tab = tabBarController?.tabBar, !hidesBottomBarWhenPushed {
            //tableView!.bottomAnchor.constraint(equalTo: tab.topAnchor).isActive = true
            tableView!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -tab.bounds.height).isActive = true
        } else {
             tableView!.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        // 设置内容缩进
//        tableView?.contentInset = UIEdgeInsets(top: navigationBar?.bounds.height ?? 0,
//                                               left: 0,
//                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
//                                               right: 0)
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
        navigationBar?.installBlurEffect()
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



extension WBBaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}






