//
//  WBNavigationController.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
        //  隐藏默认的条
        isNavigationBarHidden = true
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        print("pushViewController  child count: \(childViewControllers.count)")
        
        if childViewControllers.count > 0 {
            var strTitle = "返回"
            viewController.hidesBottomBarWhenPushed = true
            if let bvc = (viewController as? WBBaseViewController) {
            interactivePopGestureRecognizer?.delegate = bvc
                if childViewControllers.count == 1 {
                    strTitle = childViewControllers.first?.title ?? strTitle
                }
            }
            //let leftBtn = UIBarButtonItem(title: strTitle, style: .plain, target: self, action: #selector(popToParent))
            let leftBtn = UIBarButtonItem(title: strTitle, fontSize: 16, target: self, action: #selector(popToParent), isBack: true)
            viewController.navigationItem.leftBarButtonItem = leftBtn
        }
        
      
    

        super.pushViewController(viewController, animated: true)
    }
    
    
    @objc private func popToParent() {
        popViewController(animated: true)
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
