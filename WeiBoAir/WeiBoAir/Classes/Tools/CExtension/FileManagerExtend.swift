//
//  FileManagerExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/8/25.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

extension FileManager {
    class func documentsDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]
        return paths[0]
    }
    
    class func cachesDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
        return paths[0]
    }
}
