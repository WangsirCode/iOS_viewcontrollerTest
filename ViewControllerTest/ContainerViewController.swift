//
//  ContainerViewController.swift
//  ViewControllerTest
//
//  Created by 汪宇豪 on 2016/11/3.
//  Copyright © 2016年 汪宇豪. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var ct1 = PresentedController()
    var ct2 = PresentedController()
    var ct3 = PresentedController()

    @IBAction func add(_ sender: Any) {
        self.addChildViewController(ct1)
        self.view.addSubview(ct1.view)
        //self.ct1.didMove(toParentViewController: self)
    }
    @IBAction func remove(_ sender: Any) {
        self.ct1.willMove(toParentViewController: nil)
        self.ct1.view.removeFromSuperview()
        self.ct1.removeFromParentViewController()
    }
    @IBAction func transition(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ct1.index = "add"
        self.ct2.index = "remove"
        self.ct3.index = "transition"
    }
    
}
