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
    // 基本数据类型不能设置成可选的。要给一个初始值
    var age: Int = 0
    var age2: Double = 0
    var age3: Float = 0
    var age4: Float64 = 0
    var age5: Bool = false
    
    override init() {
        self.name = ""
        super.init()
    }
    init(name: String) {
        self.name = name
        super.init()
    }
    
    //  便利构造
    convenience init?(age: Int) {
        if (age > 100) {
            return nil
        }
        self.init()
    }
    
    // kvc
    init(dic: [String:AnyObject]) {
        super.init()
        // super.init() 要先于setValueForKeys
        self.setValuesForKeys(dic)
    }
    
    override var description: String {
        return "\(self.name), \(self.age), \(self.age5)"
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

