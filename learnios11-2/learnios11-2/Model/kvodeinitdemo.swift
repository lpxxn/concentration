//
//  kvodeinitdemo.swift
//  learnios11-2
//
//  Created by li on 2018/7/24.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

class Car: NSObject {
    //KVO观察的属性必须是dynamic
    @objc dynamic var miles = 0
    @objc dynamic var name = "Turbo"
    var timer: Timer?
    override init() {
        super.init()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
    }
    
    @objc func timeAction() {
        self.miles = Int(arc4random())
    }
    
    deinit {
        print("Car deinit")
        timer?.invalidate()
        timer = nil
    }
}

class CarObserver: NSObject {
    private var kvoContext: UInt8 = 1
    var name: String?
    private var car: Car
    init(_ car: Car) {
        self.name = "li"
        self.car = car
        super.init()

        /*
         第一个参数:观察者对象
         第二个参数:观察的属性
         第三个参数:观察的属性的什么值(新值，旧值等)
         第四个参数:nil
        */
        car.addObserver(self, forKeyPath: "miles", options: NSKeyValueObservingOptions.new, context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        /*
         第一个参数:属性
         第二个参数:被观察者对象
         第三个参数:属性变化信息
         第四个参数:上下文nil
         */
        //获取属性变化值
        let newValue = change![NSKeyValueChangeKey.newKey]
        print(newValue)
    }
    
    deinit {
        print("CarObserver deinit")
        car.removeObserver(self, forKeyPath: "miles")

    }
}
