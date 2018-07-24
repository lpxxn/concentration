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
        let p1 = Person(dic: ["name": "lilililili" as AnyObject,
                              "age": 1111 as AnyObject,
                              "age2": 123 as AnyObject,
                              "age3": 333 as AnyObject,
                              "age4": 444 as AnyObject,
                              "age5": true as AnyObject])
        print("p name \(p1.name) age \(p1)")
        
        setupUI()
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
            print(wSefl?.view ?? "")
        }
        
        loadData2 {
            [weak self] in
                print(self?.view ?? "")
            
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
    
    
    var tf1: UITextField?
    var tf2: UITextField?
    var l3: UITextField?
    
    func setupUI() -> () {
        var tf1 = UITextField(frame: CGRect(x: 20, y: 120, width: 100, height: 30))
        tf1.borderStyle = .roundedRect
        tf1.text = "0"
        view.addSubview(tf1)
        self.tf1 = tf1
        
        var tf2 = UITextField(frame: CGRect(x: 140, y: 120, width: 100, height: 30))
        tf2.borderStyle = .roundedRect
        tf2.text = "0"
        view.addSubview(tf2)
        self.tf2 = tf2
        
        let l1 = UITextField(frame: CGRect(x: 120, y: 120, width: 20, height: 30))
        //l1.borderStyle = .roundedRect
        l1.textAlignment = .center
        l1.text = "+"
        view.addSubview(l1)
        
        let l2 = UITextField(frame: CGRect(x: 240, y: 120, width: 20, height: 30))
        //l1.borderStyle = .roundedRect
        l2.textAlignment = .center
        l2.text = "="
        view.addSubview(l2)
        
        let l3 = UITextField(frame: CGRect(x: 260, y: 120, width: 100, height: 30))
        //l1.borderStyle = .roundedRect
        l3.textAlignment = .center
        l3.text = "100"
        view.addSubview(l3)
        
        self.l3 = l3
        
        // button
        let btn1 = UIButton()
        btn1.setTitle("calc", for: UIControlState(rawValue:  0))
        btn1.setTitleColor(.black, for: .normal)
        btn1.sizeToFit()
        btn1.center = view.center
        view.addSubview(btn1)
        btn1.addTarget(self, action: #selector(calac), for: .touchUpInside)
        
        let btn2 = UIButton()
        
        btn2.setTitle("Other", for: .normal)
        btn2.setTitleColor(.red, for: .normal)
        view.addSubview(btn2)
        btn2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            btn2.widthAnchor.constraint(equalToConstant: 120),
            btn2.heightAnchor.constraint(equalToConstant: 30),
            btn2.topAnchor.constraint(lessThanOrEqualTo: btn1.bottomAnchor, constant: 20),
            btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        
        // 或者 这样添加 constraint
//
//        let width =  NSLayoutConstraint(item: btn2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
//
//        let height = NSLayoutConstraint(item: btn2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
//        let xhori = NSLayoutConstraint(item: btn2, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
//
//        let top = NSLayoutConstraint(item: btn2, attribute: .top, relatedBy: .equal, toItem: btn1, attribute: .bottom, multiplier: 1, constant: 30)
//
//        NSLayoutConstraint.activate([width, height, xhori, top])
        
        btn2.addTarget(self, action: #selector(btnTouchUp(_:)), for: .touchUpInside)
    }
    
    @objc func calac() {
        print("button touchup")

        guard let num1 = Int(tf1?.text ?? ""),
            let num2 = Int(tf2?.text ?? "")
        else {
            print("error")
            return
        }
        l3?.text = "\(num1 + num2)"
        
//        let t1 = Float(tf1!.text!)
//        let t2 = Float(tf2!.text!)
//        l3.text = String(t1! + t2!)
    }
    
    @objc func btnTouchUp(_ btn: UIButton) {
        let t = btn.titleLabel?.text ?? "nil"
        print(t)
        print(#function)
    }
}

