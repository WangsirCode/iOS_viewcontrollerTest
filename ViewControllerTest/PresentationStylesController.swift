//
//  PresentationStylesController.swift
//  ViewControllerTest
//
//  Created by 汪宇豪 on 2016/11/3.
//  Copyright © 2016年 汪宇豪. All rights reserved.
//

import UIKit

class PresentationStylesController: UITableViewController {
    let model = ["FullScreen","OverFullScreen","PageSheet","FormSheet","CurrentContext","OverCurrentContext","popover"]
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.model[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PresentedController()
        if indexPath.row == 0 {
            controller.modalPresentationStyle = .fullScreen
        }
        else if indexPath.row == 1{
            controller.modalPresentationStyle = .overFullScreen
        }
        else if indexPath.row == 2{
            controller.modalPresentationStyle = .pageSheet
        }
        else if indexPath.row == 3{
            controller.modalPresentationStyle = .formSheet
        }
        else if indexPath.row == 4{
            controller.modalPresentationStyle = .currentContext
        }
        else if indexPath.row == 5{
            controller.modalPresentationStyle = .overCurrentContext
        }
//        else if indexPath.row == 6{
//            controller.modalPresentationStyle = .popover
//        }
        self.present(controller, animated: true, completion: nil)
        
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
