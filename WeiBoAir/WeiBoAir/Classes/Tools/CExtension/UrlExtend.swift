//
//  UrlExtend.swift
//  WeiBoAir
//
//  Created by li on 2018/8/21.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

extension URL {
    func getQueryStringParameter(param: String) -> String? {
        guard let urlComponents = NSURLComponents(url: self, resolvingAgainstBaseURL: false),
            let queryItems = urlComponents.queryItems else {
                return nil
        }
        
        return queryItems.first(where: { $0.name == param })?.value
    }
}
