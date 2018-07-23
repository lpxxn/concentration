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
        // 循环引用 单方向对引用是不会产生循环引用的
        // - 只是闭包对self 进行了copy，闭包执行完成后，会自动销毁，同时释放对self的引用
        // - 同时需要 self 对闭包引用
        weak var wSefl = self
        loadData2 {
            // 如果去掉下面的self.view是没有问题的，会执行deinit
            // print(self.view)
            
            // ？可选解包， wself 被释放后没有出错
            // ! 如果用！ wself被释放后会报错
            // error :print(wSefl!.view)
            print(wSefl?.view)
        }
        
        loadData2 {
            [weak self] in {
                print(self?.view ?? "")
            }
        }
//       unowned 和上面的！一样，提前被释放会报错
//        loadData2 {
//            [unowned self] in {
//                print(self.view)
//            }
//        }
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
    var completionCallBack: (()->())?
    func loadData2(completion: @escaping ()->()) -> () {
        // 循环引用
        self.completionCallBack = completion
        DispatchQueue.global().async {

            print("耗时操作\(Thread.current)")
            Thread.sleep(forTimeInterval: 2)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    deinit {
        print("page deinit")
    }
}

