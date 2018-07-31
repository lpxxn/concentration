//
//  BundleExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

extension Bundle {
    var NS: String {
        //print("Bundles: \(infoDictionary)")
        return infoDictionary!["CFBundleName"] as? String ?? ""
    }
    
    var WBApk: String {
        return infoDictionary!["wbappkey"] as! String
    }
}
