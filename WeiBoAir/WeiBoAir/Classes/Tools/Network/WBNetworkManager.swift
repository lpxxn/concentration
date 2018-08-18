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
    
    func request(method: WBHTTPMethod = .GET, url: String, paramters:[String:AnyObject]?, completion: @escaping (_ json: Any?, _ isSuccess: Bool)->()) {
        let success = { (task: URLSessionTask, json: Any?) -> () in
            
            completion(json, true)
        }
        
        let failure = { (task: URLSessionTask?, error: Error) -> () in
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
