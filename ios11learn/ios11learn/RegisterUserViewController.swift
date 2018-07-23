//
//  RegisterUserViewController.swift
//  ios11learn
//
//  Created by li on 2018/7/19.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {
    @IBOutlet weak var firstNameTestField: UITextField!
    @IBOutlet weak var lastNameTestField: UITextField!
    @IBOutlet weak var emailAddressTestField: UITextField!
    @IBOutlet weak var passwordTestField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        print("cancel tapped")
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        print("signupButtonTapped")
        if (firstNameTestField.text?.isEmpty)! ||
            lastNameTestField.text!.isEmpty {
            displayMessage(userMsg: "please input text")
            return
        }
        
    }
    
    
    func displayMessage(userMsg: String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: userMsg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            {
                (action: UIAlertAction) in
                print("ok button tapped")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    deinit {
        print("register UserView controller deinit")
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
