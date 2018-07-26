//
//  ListViewController.swift
//  learnios11-3
//
//  Created by li on 2018/7/26.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //weak var weakSelf = self
        loadData { [weak self] list in
            self?.personList = list
            print("\(String(describing: self?.personList))")
            self?.tableView.reloadData()
        }

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func loadData(completion: @escaping ([Person]) -> ()) -> () {
        DispatchQueue.global().async {
            print("loading data....")
            Thread.sleep(forTimeInterval: 1)
            var arrayM = [Person]()
            for i in 0..<20 {
                let p = Person()
                p.name = "zhangsan- \(i)"
                p.phone = "1868" + String(format: "%06d", arc4random_uniform(10000000))
                p.title = "boss"
                arrayM.append(p)
            }
            
            DispatchQueue.main.async {
                completion(arrayM)
            }
            
        }
    }
    
    // MARK: - suge
    @IBAction func addNewPersonData(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "List2Detail", sender: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "List2Detail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detalControl = segue.destination as! DetailViewController
        if let indexPath = sender as? IndexPath {
            let person = personList[indexPath.row]
            detalControl.personInfo = person
            detalControl.completeUpdateInfo = {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        } else {
//            let person = Person()
//            detalControl.personInfo = person
          
            // detalControl  引用闭包 闭包引用 detalControl
            detalControl.completeUpdateInfo = { [weak detalControl] in
                guard let person = detalControl?.personInfo else {
                    return
                }
                self.personList.append(person)
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        print("list deinit")
    }

}
