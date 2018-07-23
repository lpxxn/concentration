//
//  ViewController.swift
//  learnios11-2
//
//  Created by li on 2018/7/23.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData { (rev) in
            print("news \(rev)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(completion: @escaping (_ result: [String])->()) ->() {
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            Thread.sleep(forTimeInterval: 2)
            let json = ["li", "peng", "zhang", "san"]
            DispatchQueue.main.async {
                print("修改主线程UI\(Thread.current)")
                completion(json)
            }
             print("执行到这儿结束了") //函数结束后才去调用的闭包这个就是逃逸闭包
        }
    }

}

