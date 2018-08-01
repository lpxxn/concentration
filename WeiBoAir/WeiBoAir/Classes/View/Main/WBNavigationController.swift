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
            viewController.hidesBottomBarWhenPushed = true
        }
        var leftBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(popToParent))
        viewController.navigationItem.leftBarButtonItem = leftBtn
//        viewController.navigationItem.backBarButtonItem = leftBtn
//        viewController.navigationItem.leftItemsSupplementBackButton = true
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
