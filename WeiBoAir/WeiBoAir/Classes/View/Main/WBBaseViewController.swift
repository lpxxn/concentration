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
//        var topSafeArea: CGFloat
//        var bottomSafeArea: CGFloat
//
//        if #available(iOS 11.0, *) {
//            topSafeArea = view.safeAreaInsets.top
//            bottomSafeArea = view.safeAreaInsets.bottom
//        } else {
//            topSafeArea = topLayoutGuide.length
//            bottomSafeArea = bottomLayoutGuide.length
//        }
        

        
        /*
         THe layout is incorrect. The navigation bar height should be 44pts tall (not 64) and the frame.origin.y should be placed at topLayoutGuide.height. Your navigation bar delegate should then implement -positionForBar: to return UIBarPositionTopAttached.
         
         You can see how UINavigationController places the navigation bar as an example, but it is almost certainly simpler to just use a UINavigationController to get the navigation bar placed correctly instead.
         
        */
        
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 64))
        navigationBar!.contentMode = .bottom
        view.addSubview(navigationBar!)
        navigationBar!.items = [navigationItem]
        
        
        navigationBar?.translatesAutoresizingMaskIntoConstraints = false
        
        
//        if #available(iOS 11, *) {
//           let guide = view.safeAreaLayoutGuide.bottomAnchor
//           let height = (navigationBar?.frame.height)! - CGFloat(12)
//            navigationBar?.topAnchor.constraint(equalTo: guide, constant: 0)
//            navigationBar?.heightAnchor.constraint(equalToConstant: height).isActive = true
//
//            //            NSLayoutConstraint.activate([
//            ////                self.yourTableView.topAnchor.constraint(equalTo: guide, constant: height)
//            ////                ])
//        }
        
//        if #available(iOS 11.0, *) {
//
//            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        }
        
        
        navigationBar?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationBar?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       
        if #available(iOS 11.0, *) {
            print("ios 11 version.")
            navigationBar?.heightAnchor.constraint(equalToConstant: 44).isActive = true
            navigationBar?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            // Fallback on earlier versions
            navigationBar?.heightAnchor.constraint(equalToConstant: 64).isActive = true
        }
        navigationBar?.installBlurEffect()
        
        
        
//
//        if let window = UIApplication.shared.keyWindow {
//            NSLayoutConstraint.activate([
//                navigationBar.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor, constant: 0),
//                navigationBar.leadingAnchor.constraint(equalTo: window.safeAreaLayoutGuide.leadingAnchor),
//                navigationBar.trailingAnchor.constraint(equalTo: window.safeAreaLayoutGuide.trailingAnchor),
//                navigationBar.heightAnchor.constraint(equalToConstant: 64)
//                ])
//        }

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









