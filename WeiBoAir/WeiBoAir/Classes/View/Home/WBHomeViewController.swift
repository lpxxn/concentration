//
//  WBHomeViewController.swift
//  WeiBoAir
//
//  Created by li on 2018/7/28.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {

    // 列表视图模型
    private lazy var listViewModel = WBStatusListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        // afn 加载网络数据

//        WBNetworkManager.shared.request(url: url, paramters: params as [String : AnyObject]) { (json, t) in
//            print("\(json)")
//        }
 
       
        
        print("Screen size width", UIScreen.main.lp_screenWidth, " \(UIScreen.main.bounds.size.width)  height: ", UIScreen.main.lp_screenHeight, " scale ", UIScreen.main.lp_screenScale)
        
        print("Screen bound width", UIScreen.main.bounds.width, "   height: ", UIScreen.main.bounds.height, " scale: ", UIScreen.main.scale)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadData() {
        print("开始加载数据")
        
        listViewModel.loadStatus { (isSuccess) in
            self.refreshControl?.endRefreshing()
            self.tableView?.reloadData()
        }
        // 模拟延时加载数据 dispach_after
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            for i in 0..<25 {
//                // 插入到数组的顶部
//                self.statusList.insert(i.description, at: 0)
//            }
//            print("刷新")
//            // 结束刷新控件
//            self.refreshControl?.endRefreshing()
//            self.tableView?.reloadData()
//        }
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @objc private func showFrends() {
        print(#function)
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}


// MARK: - setupUI
extension WBHomeViewController {
    @objc override func setupUI() {
        super.setupUI()
    }
}



// MARK: - TableView
extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = listViewModel.statusList[indexPath.row].text
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = listViewModel.statusList.count - 1
        if !isPullup && indexPath.row == lastElement {
            print("-------------------")
        }
    }
    
    override func setupTableView() {
        super.setupTableView()
        navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFrends))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}



