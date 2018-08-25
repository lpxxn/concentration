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
    
    override init() {
        super.init()
        // 加载保存的文件
        let path = accountFileName.appendDocumentDir()
        guard let data = NSData(contentsOfFile: path),
        let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject] else {
            return
        }
        self.yy_modelSet(with: dict ?? [:])
        
        // 判断是否过期
        // expireData = Date(timeIntervalSinceNow: -3600 * 24)
        if expireData?.compare(Date()) != .orderedDescending {
            // 过期
            access_token = nil
            uid = nil
            expireData = nil
            
            // 删除用户文件
            try? FileManager.default.removeItem(atPath: path)
        }
    }
    
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
        print("useraccount file path: \(filePath)")
        (data as NSData).write(toFile: filePath, atomically: true)
    }
    
}
