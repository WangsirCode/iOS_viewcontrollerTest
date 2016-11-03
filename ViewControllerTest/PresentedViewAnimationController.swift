//
//  PresentedViewAnimationController.swift
//  ViewControllerTest
//
//  Created by 汪宇豪 on 2016/11/3.
//  Copyright © 2016年 汪宇豪. All rights reserved.
//

import UIKit

class PresentedViewAnimationController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var model = ["CoverVertical","FlipHorizontal","CrossDissolve","PartialCurl"]
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableview.deselectRow(at: indexPath, animated: false)
        let controler = PresentedController()
        if indexPath.row == 0 {
            controler.modalTransitionStyle = .coverVertical
        }
        else if indexPath.row == 1{
            controler.modalTransitionStyle = .flipHorizontal
        }
        else if indexPath.row == 2{
            controler.modalTransitionStyle = .crossDissolve
        }
        else if indexPath.row == 3{
            controler.modalTransitionStyle = .partialCurl
        }
        self.present(controler, animated: true, completion: nil)
    }
}
