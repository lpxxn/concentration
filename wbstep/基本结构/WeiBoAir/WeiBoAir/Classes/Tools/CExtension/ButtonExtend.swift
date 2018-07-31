//
//  ButtonExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/7/29.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    static func lp_imageButton(imageName: String, backImageName: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: "\(imageName)_highlighted"), for: .highlighted)
        
        button.setBackgroundImage(UIImage(named: backImageName), for: .normal)
        button.setBackgroundImage(UIImage(named: "\(backImageName)_highlighted"), for: .highlighted)
        
        button.sizeToFit()
    
        return button
    }
}
