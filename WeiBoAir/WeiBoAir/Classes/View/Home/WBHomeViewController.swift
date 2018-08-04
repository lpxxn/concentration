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

    private lazy var statusList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let btn = UIButton.lp_textButton(title: "liPeng", fontSize: 16, normalColor: .black, highlightedColor: .blue, backgroundImgName: "")
        btn.setImage(UIImage(named: "navigationbar_friendsearch"), for: .normal)
        btn.setImage(UIImage(named: "navigationbar_back_withtext_highlighted"), for: .highlighted)
        btn.center = view.center
        btn.sizeToFit()
        view.addSubview(btn)
        
        print("Screen size width", UIScreen.main.lp_screenWidth, " \(UIScreen.main.bounds.size.width)  height: ", UIScreen.main.lp_screenHeight, " scale ", UIScreen.main.lp_screenScale)
        
        print("Screen bound width", UIScreen.main.bounds.width, "   height: ", UIScreen.main.bounds.height, " scale: ", UIScreen.main.scale)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadData() {
        for i in 0..<15 {
            // 插入到数组的顶部
            statusList.insert(i.description, at: 0)
        }
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

extension WBHomeViewController {
    @objc override func setupUI() {
        super.setupUI()
        navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFrends))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}


extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
        
    }
}



