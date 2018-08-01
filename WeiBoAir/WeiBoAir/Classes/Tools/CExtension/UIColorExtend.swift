//
//  UIColorExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(min: 0, max: 1),
                       green: .random(min: 0, max: 1),
                       blue: .random(min: 0, max: 1),
                       alpha: 1.0)
    }
    // view.backgroundColor = UIColor(rgb: 0x209624)
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
