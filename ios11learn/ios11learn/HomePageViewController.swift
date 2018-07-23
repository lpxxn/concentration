//
//  HomePageViewController.swift
//  ios11learn
//
//  Created by li on 2018/7/20.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var uerFullNameLabel: UILabel!
    @IBAction func signOutButtonTapped(_ sender: UIBarButtonItem) {
        print("signOutButtonTapped")
    }
    @IBAction func loadMemberProfileButtonTapped(_ sender: UIButton) {
        print("loadMemberProfileButtonTapped")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
