//
//  WBNetworkManagerExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/8/18.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import HandyJSON
// MARK: - 封装网络请求
extension WBNetworkManager {
    func statusList(sinceId: Int64 = 0, maxId: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool) -> ()) {
        let url = "https://api.weibo.com/2/statuses/home_timeline.json"
        //let params = ["access_token":"2.00ROiI2CFsvSQD1314a596f5066RYj"]
        
        let params = ["since_id": sinceId, "max_id": maxId > 0 ? maxId - 1 : 0]
        tokenRequest(method: .GET, url: url, params: params as [String : AnyObject]) { (json, isSuccess) in
            print("\(json ?? "no value" as AnyObject)")
            let st1 = "aaa"
            print(st1)
//                let str = "\(String(describing: json!["statuses"]!!))"
//                guard let result = [WBStatus].deserialize(from: str) else {
//                    completion([], false)
//                    return
//                }
        
            // json 中获得statuese 字典数组 as? 失败 result = nil
            let result = json?["statuses"] as? [[String: AnyObject]]
            completion(result, isSuccess)

          
        }
    }
    
    func unreadCount(completion: @escaping (_ count: Int) -> ()) {
        //let url = "https://api.t.sina.com.cn/statuses/unread.json"
        //let params = ["source": appKey]
        
        let url = "https://rm.api.weibo.com/2/remind/unread_count.json"
        let params = ["uid": uid]
        
        tokenRequest(url: url, params: params as [String : AnyObject]) { (json, isSuccess) in
            print(json)
            let dict = json as? [String: AnyObject]
            let count = dict?["status"] as? Int ?? 0
            completion(count)
        }
        
    }
}
