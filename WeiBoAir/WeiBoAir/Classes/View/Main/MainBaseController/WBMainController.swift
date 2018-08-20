//
//  WBMainController.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class WBMainController: UITabBarController {
    // 定时器
    private var timer: Timer?
    lazy var homeTabbarIsTarget: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupChildControllers()
        setComposeButton()
        
        setupTimer()
        delegate = self
        
        // 注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(userLogin), name: NSNotification.Name(rawValue: WBUserShouldLoginNotification), object: nil)
    }
    deinit {
        timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func userLogin(n: Notification) {
        print("用户登录通知\(n)）")
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
        // 这个是因为下面用 tabbarcontroler shouldSelect 方法判断了所以不用-1了
        //let w = tabBar.bounds.width / count - 1
        let w = tabBar.bounds.width / count
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

//
// MARK: - 时钟相关
extension WBMainController {
    private func setupTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(undateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func undateTimer() {
        if !WBNetworkManager.shared.userLogin {
            return
        }
        print(#function)
        // test 未读数量
        WBNetworkManager.shared.unreadCount { (count) in
            print("有\(count)条新微博")
            self.tabBar.items?[0].badgeValue = count > 0 ? "\(count)" : nil
            // 从ios8 开始要有授权才能显示通知
            UIApplication.shared.applicationIconBadgeNumber = count
        }
    }
}

// tabbar delegate
extension WBMainController: UITabBarControllerDelegate {
    
    /// 将要选择 TabbarItem
    ///
    /// - Parameters:
    ///   - tabBarController: tabbarController
    ///   - viewController: 目标控制器
    ///
    ///
    /// - Returns: 是否切换到目标控制器
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("将要执行的Tabbar \(viewController)")
        // 中间的那个加号按钮是UIViewController所以
        //1 > 获以控制器在数组中的索引
        let idx = childViewControllers.index(of: viewController)
        //2 > 得到当前索引
        // 同时idx也是首页，重复点击首页
        if selectedIndex == 0 && idx == selectedIndex && !homeTabbarIsTarget{
            homeTabbarIsTarget = true
            //print("点击首页")
            // 让表格滚动到顶
            // 获取到控制器
            let nav = childViewControllers[0] as! UINavigationController
            let vc = nav.childViewControllers[0] as! WBHomeViewController
            // 滚动到顶部
            vc.tableView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            // 刷新表格
            // 增加延迟，是保证表格先滚动顶部，再加载数据
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                vc.loadData()
                self.homeTabbarIsTarget = false
            }
            
        }
        
        return !viewController.isMember(of: UIViewController.self)
    }
}



