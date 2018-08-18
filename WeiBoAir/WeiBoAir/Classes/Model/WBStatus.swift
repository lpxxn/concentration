//
//  WBStatus.swift
//  WeiBoAir
//
//  Created by li on 2018/8/18.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import YYModel
import HandyJSON
class WBStatus: NSObject {
    /// Int 类型 在64位的机器上是64位 在32位的机器上是32位的
    ///如果不写 Int64 在iPad 2/iphone5/5c/4s/4 都是无法正常运行的
    var id: Int64 = 0
    
    /// 微博信息内容
    var text: String?
    
}
