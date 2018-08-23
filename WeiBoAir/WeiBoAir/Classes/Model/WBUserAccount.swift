//
//  WBUserAccount.swift
//  WeiBoAir
//
//  Created by li on 2018/8/23.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import YYModel

class WBUserAccount: NSObject {
    @objc var access_token: String? = "2.00ROiI2C09mo9n2d6bf48240T1KJRE"
    /// 用户代号
    @objc var uid: String?
    
    
    /// 过期时间
    /// 开发者5年
    /// 使用者3天
    @objc var expires_in: TimeInterval = 0.0
    
    override var description: String {
            return yy_modelDescription()
    }
    
}
