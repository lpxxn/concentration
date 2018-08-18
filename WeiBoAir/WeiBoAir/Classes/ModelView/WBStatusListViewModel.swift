//
//  WBStatusListViewModel.swift
//  WeiBoAir
//
//  Created by li on 2018/8/18.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

// 如果类需要kvc 或者字典转模型就需要继承 NSObject
// 如果只是包装一些代码逻辑，就不需要继承

// 负责微博数据处理
class WBStatusListViewModel {
    lazy var statusList = [WBStatus]()
    
    func loadStatus(isPullup: Bool, completion: @escaping (_ isSuccess: Bool, _ shouldRefresh: Bool) -> ()) {
        
        // 上面的id 是最大的
        let sinceId = statusList.first?.id ?? 0
        
        WBNetworkManager.shared.statusList(sinceId: sinceId, maxId: 0) { (list, isSuccess) in
            
            if !isSuccess {
                completion(false, false)
            }
            var array = [WBStatus]()
            
            // yymodel 不能用😭
//            guard var array = NSArray.yy_modelArray(with: WBStatus.self, json: list ?? []) as? [WBStatus] else {
//                completion(false)
//                return
//            }
            
            for dic in list ?? [] {
                
//                //创建微博模型 - 创建失败 继续遍历
//                guard let model = WBStatus.yy_model(with: dic) else{
//                    continue
//                }
                let m = WBStatus()
                m.id = dic["id"] as! Int64
                m.text = dic["text"] as? String
                //将视图模型添加到数组
                array.append(m)
            }
            if isPullup {
                self.statusList += array
            } else {
                self.statusList = array + self.statusList
            }
            completion(true, true)
        }
    }
}
