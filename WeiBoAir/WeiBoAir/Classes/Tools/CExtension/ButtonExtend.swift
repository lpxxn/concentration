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
    
    static func lp_textButton(title: String, fontSize: CGFloat, normalColor: UIColor, highlightedColor: UIColor, backgroundImgName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(normalColor, for: .normal)
        button.setTitleColor(highlightedColor, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)

        
        if !backgroundImgName.isEmpty {
            button.setBackgroundImage(UIImage(named: backgroundImgName), for: .normal)
            let backgroundImgNameHL = "\(backgroundImgName)_highlighted"
            button.setBackgroundImage(UIImage(named: backgroundImgNameHL), for: .highlighted)
        }
        
        button.sizeToFit()
        return button
    }
    
    static func lp_textWidthImgButton(title: String, fontSize: CGFloat, normalColor: UIColor, highlightedColor: UIColor, backgroundImgName: String, imgName: String) -> UIButton {
        let btn = lp_textButton(title: title, fontSize: fontSize, normalColor: normalColor, highlightedColor: highlightedColor, backgroundImgName: backgroundImgName)
        
        btn.setImage(UIImage(named: imgName), for: .normal)
        btn.setImage(UIImage(named: "\(imgName)_highlighted"), for: .highlighted)
        btn.sizeToFit()
        return btn
    }
}
