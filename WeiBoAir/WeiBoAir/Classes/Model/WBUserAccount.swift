//
//  WBUserAccount.swift
//  WeiBoAir
//
//  Created by li on 2018/8/23.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import YYModel

private let accountFileName: String = "userAccount.json"
class WBUserAccount: NSObject {
    @objc var access_token: String? //= "2.00ROiI2C09mo9n2d6bf48240T1KJRE"
    /// 用户代号
    @objc var uid: String?
    
    
    /// 过期时间
    /// 开发者5年
    /// 使用者3天
    @objc var expires_in: TimeInterval = 0.0 {
        didSet {
            expireData = Date(timeIntervalSinceNow: expires_in)
        }
    }
    
    @objc var expireData: Date?
    
    override var description: String {
            return yy_modelDescription()
    }
    
    func saveAccount() {
        // 1. 模型转视频
        var dict = self.yy_modelToJSONObject() as? [String: AnyObject] ?? [:]
        dict.removeValue(forKey: "expires_in")
        // 字典序列化data
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {
            return
        }
        //let filePath = FileManager.documentsDir()
        let filePath = accountFileName.appendDocumentDir()
        (data as NSData).write(toFile: filePath, atomically: true)
    }
    
}
