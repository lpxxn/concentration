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
}
