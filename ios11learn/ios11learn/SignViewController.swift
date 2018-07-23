//
//  SignViewController.swift
//  ios11learn
//
//  Created by li on 2018/7/19.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let btn = UIButton()
//        btn.setTitle("Come on", for: UIControlState(rawValue: 0))
//        btn.setTitleColor(.black, for: UIControlState(rawValue: 0))
//        btn.sizeToFit()
//        btn.center = view.center
//        //btn.backgroundColor = .black
//        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        print("Sign in button tapped")
    }
    
    @IBAction func registerNewAccountButtonTapped(_ sender: Any) {
        print("Register account button tapped")
        
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterUserViewController") as! RegisterUserViewController
//        registerViewController.modalTransitionStyle = .partialCurl
//        registerViewController.modalPresentationStyle = .pageSheet
        self.present(registerViewController, animated: true)
        //performSegue(withIdentifier: "RegisterUserViewController", sender: self)
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
