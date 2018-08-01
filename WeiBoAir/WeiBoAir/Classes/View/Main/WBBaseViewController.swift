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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random
        
        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupUI()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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
        }
        navigationBar?.installBlurEffect()

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
    }
}


extension WBBaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        //return true
        return (self.navigationController?.childViewControllers.count ?? 0) > 1
    }
}









