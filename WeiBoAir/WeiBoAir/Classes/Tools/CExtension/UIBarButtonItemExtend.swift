//
//  UIBarButtonItemExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/8/1.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    /// 返回按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - fontSize: 字体大小
    ///   - target: 目标
    ///   - action: 行为
    ///   - isBack: 不否显示小箭头
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject?, action: Selector, isBack: Bool = false) {
        var btn: UIButton
        if !isBack {
            btn = UIButton.lp_textButton(title: title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, backgroundImgName: "")
        } else {
            btn = UIButton.lp_textWidthImgButton(title: title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, backgroundImgName: "", imgName: "navigationbar_back_withtext")
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: btn)
    }
}
