//
//  WBMainController.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class WBMainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupChildControllers()
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

extension WBMainController {
    private func setupChildControllers() {
        let array = [
            ["clsName": "WBHomeViewController", "title": "首页", "imageName": "home"],
            //["clsName": "", "title": "", "imageName": ""],
            ["clsName": "WBMessageViewController", "title": "消息", "imageName": "message_center"],
            ["clsName": "WBDiscoverViewController", "title": "发现", "imageName": "discover"],
            ["clsName": "WBProfileViewController", "title": "资料", "imageName": "profile"],
        ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
            
        }
        viewControllers = arrayM
    }
    
    private func controller(dict: [String: String]) -> UIViewController {
        guard  let className = dict["clsName"],
            let title = dict["title"],
            let imgName = dict["imageName"],
            let cls = NSClassFromString("\(Bundle.main.NS).\(className)") as? UIViewController.Type
            else {
            return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        

        
        let nav = WBNavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage(named: "tabbar_\(imgName)")
        nav.tabBarItem.selectedImage = UIImage(named: "tabbar_\(imgName)_selected")?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange], for: UIControlState.highlighted)
        // 设置字体 设置normal 才有效。默认为12号字
        nav.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)], for: .normal)

        
        return nav
    }
}





