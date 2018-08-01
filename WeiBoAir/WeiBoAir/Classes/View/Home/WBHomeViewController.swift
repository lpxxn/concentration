//
//  WBHomeViewController.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let btn = UIButton.lp_textButton(title: "liPeng", fontSize: 16, normalColor: .black, highlightedColor: .blue, backgroundImgName: "")
        btn.setImage(UIImage(named: "navigationbar_friendsearch"), for: .normal)
        btn.setImage(UIImage(named: "navigationbar_back_withtext_highlighted"), for: .highlighted)
        btn.center = view.center
        btn.sizeToFit()
        view.addSubview(btn)
        
        print("Screen size width", UIScreen.main.lp_screenWidth, " \(UIScreen.main.bounds.size.width)  height: ", UIScreen.main.lp_screenHeight, " scale ", UIScreen.main.lp_screenScale)
        
        print("Screen bound width", UIScreen.main.bounds.width, "   height: ", UIScreen.main.bounds.height, " scale: ", UIScreen.main.scale)
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
