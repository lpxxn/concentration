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
        setComposeButton()
    }
    
    private lazy var composeButton: UIButton = UIButton.lp_imageButton(imageName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
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
    
    private func setComposeButton() {
        tabBar.addSubview(composeButton)
        let count: CGFloat = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        composeButton.frame = tabBar.bounds.insetBy(dx: w * 2, dy: 0)
    }
    
    private func setupChildControllers() {
        let array = [
            ["clsName": "WBHomeViewController", "title": "首页", "imageName": "home", "visitorInfo": ["imgName":"", "msg": "一去二三里，山村四五家。亭台六七座，八九十支花"]],
            ["clsName": "WBMessageViewController", "title": "消息", "imageName": "message_center", "visitorInfo": ["imgName":"visitordiscover_image_message", "msg": "千山鸟飞绝，万径人踪来，孤舟蓑笠翁，独吊寒江雪。"]],
            ["clsName": "UIViewController"],
            ["clsName": "WBDiscoverViewController", "title": "发现", "imageName": "discover", "visitorInfo": ["imgName":"visitordiscover_image_message", "msg": "一去二三里，山村四五家。亭台六七座，八九十支花"]],
            ["clsName": "WBProfileViewController", "title": "资料", "imageName": "profile", "visitorInfo": ["imgName":"visitordiscover_image_profile", "msg": "一去二三里，山村四五家。亭台六七座，八九十支花"]],
        ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
            
        }
        viewControllers = arrayM
    }
    
    private func controller(dict: [String: Any]) -> UIViewController {
        guard  let className = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imgName = dict["imageName"] as? String,
            let cls = NSClassFromString("\(Bundle.main.NS).\(className)") as? WBBaseViewController.Type,
            let visitorDic = dict["visitorInfo"] as? [String: String]
            else {
            return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title

        vc.visitorInfoDic = visitorDic
        
        let nav = WBNavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage(named: "tabbar_\(imgName)")
        nav.tabBarItem.selectedImage = UIImage(named: "tabbar_\(imgName)_selected")?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange], for: UIControlState.highlighted)
        // 设置字体 设置normal 才有效。默认为12号字
        nav.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13)], for: .normal)

        
        return nav
    }
}




