//
//  StringExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/8/25.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

extension String {
    /// 添加到文档目录中
    ///
    /// - Returns: path
    func appendDocumentDir() -> String {
        return self + FileManager.documentsDir()
    }
}
