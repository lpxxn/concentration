//
//  ScreenExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/7/31.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import UIKit


extension UIScreen {
    var lp_screenWidth: CGFloat {
        print("size width\(UIScreen.main.bounds.size.width)")
        return UIScreen.main.bounds.width
    }
    
    var lp_screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var lp_screenScale: CGFloat {
        return UIScreen.main.scale
    }
}


extension UINavigationBar {
    func installBlurEffect() {
        isTranslucent = true
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
//        backgroundColor = UIColor(
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        var blurFrame = bounds
        blurFrame.size.height += statusBarHeight
        blurFrame.origin.y -= statusBarHeight
        
        let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.isUserInteractionEnabled = false
        blurView.frame = blurFrame
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurView)

        
        blurView.layer.zPosition = -10
        //sendSubview(toBack: blurView)
    }
}
