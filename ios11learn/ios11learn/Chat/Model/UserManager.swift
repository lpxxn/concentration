//
//  UserManager.swift
//  ios11learn
//
//  Created by li on 2018/7/22.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
import SwiftyJSON


let UserInstance = UserManager.sharedInstance

class UserManager: NSObject {
    class var sharedInstance: UserManager {
        struct StaticUM {
            static let instance: UserManager = UserManager()
        }
        return StaticUM.instance
    }
    
    var nickName: String?
    var userId: String?
    var isLogin: Bool = false
    var isAdmin: Int = 0
    
    fileprivate override init() {
        super.init()
    }
    
    func userLoginSuccess(_ result: JSON) {
        self.nickName = result["client_name"].stringValue
        self.userId = result["uid"].stringValue
        self.isAdmin = result["is_room_admin"].intValue
        self.isLogin = true
        
    }
    
    func uerLogout() {
        self.nickName = ""
        self.userId = ""
        self.isAdmin = 0
        self.isLogin = false
    }
    
}


