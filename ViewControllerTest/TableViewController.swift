//
//  TableViewController.swift
//  ViewControllerTest
//
//  Created by 汪宇豪 on 2016/11/2.
//  Copyright © 2016年 汪宇豪. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let model = ["viewFrom a nib","Nib-Instantiated View Controller","statusbarTest","Presented View Animation","PresentationStyles","Container View Controllers","View Controller Lifetime Events"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.model[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let controller = NibviewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        else if indexPath.row == 1{
            let arr = UINib(nibName: "Empty", bundle: nil).instantiate(withOwner: nil, options: nil)
            self.navigationController?.pushViewController(arr[0] as! UIViewController, animated: true)
        }
        else if indexPath.row == 2{
            let controller = StatusBarController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        else if indexPath.row == 3{
            let controler = PresentedViewAnimationController()
            self.navigationController?.pushViewController(controler, animated: true)
        }
        else if indexPath.row == 4{
            let controler = PresentationStylesController()
            self.navigationController?.pushViewController(controler, animated: true)
        }
        else if indexPath.row == 5{
            let controler = ContainerViewController()
            self.navigationController?.pushViewController(controler, animated: true)
        }
        else if indexPath.row == 6{
            let controler = ViewControllerLifetimeEventsController()
            self.navigationController?.pushViewController(controler, animated: true)
        }
    }
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

}
