//
//  WBNetworkManager.swift
//  WeiBoAir
//
//  Created by li on 2018/7/29.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit
import AFNetworking

enum WBHTTPMethod {
    case GET
    case POST
}

class WBNetworkManager: AFHTTPSessionManager {
    
    
    
    static let shared: WBNetworkManager = {
        let instance = WBNetworkManager()
        //instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        instance.requestSerializer = AFJSONRequestSerializer()
        instance.responseSerializer = AFJSONResponseSerializer()
        instance.requestSerializer.setValue("application/json,text/html", forHTTPHeaderField: "Accept")
        instance.requestSerializer.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        instance.responseSerializer.acceptableContentTypes?.insert("text/html")
        return instance
    }()
    
    var accessToken: String? = "2.00ROiI2CFsvSQD1314a596f5066RYj"
    func tokenRequest(method: WBHTTPMethod = .GET, url: String, params:[String:AnyObject]?, completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool)->()) {
        
        guard let token = accessToken else {
            print("没有Token")
             // FIXME: 发送通知 提示用户登录
            completion(nil, false)
            return
        }
        
        var parameters = params
        if parameters == nil {
            parameters = [String: AnyObject]()
        }
        parameters!["access_token"] = token as AnyObject
        
        request(method: method, url: url, paramters: parameters, completion: completion)
    }
    
    func request(method: WBHTTPMethod = .GET, url: String, paramters:[String:AnyObject]?, completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool)->()) {
        let success = { (task: URLSessionTask, json: Any?) -> () in
            let str = String(describing: json)
            completion(json as AnyObject, true)
        }
        
        let failure = { (task: URLSessionTask?, error: Error) -> () in
            
            if (task?.response as? HTTPURLResponse)?.statusCode == 403 {
                
                // FIXME: 发送通知 提示
            }
            print("error: \(error)")
            completion(nil, false)
        }
        
        if method == .GET {
        get(url, parameters: paramters, progress: nil, success: success, failure: failure)
        } else {
        post(url, parameters: paramters, progress: nil, success: success, failure: failure)
        }
    }
}
