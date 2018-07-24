//
//  Person.swift
//  learnios11-2
//
//  Created by li on 2018/7/24.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation
// kvc 或者每个属性加上 @objc
@objcMembers
class Person: NSObject {
    var name: String?
    override init() {
        self.name = ""
        super.init()
    }
    init(name: String) {
        self.name = name
        super.init()
    }
    // kvc
    init(dic: [String:AnyObject]) {
        super.init()
        // super.init() 要先于setValueForKeys
        self.setValuesForKeys(dic)
    }
}

class student: Person {
    override init() {
        super.init()
    }
    
    override init(name: String) {
        super.init(name: name)
    }
}

var s1 = student()

