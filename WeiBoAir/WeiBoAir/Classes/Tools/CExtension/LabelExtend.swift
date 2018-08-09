//
//  LabelExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/8/9.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    static func lp_labelWidthText(text: String, fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = color
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }
}
