//
//  ViewControllerLifetimeEventsController.swift
//  ViewControllerTest
//
//  Created by 汪宇豪 on 2016/11/3.
//  Copyright © 2016年 汪宇豪. All rights reserved.
//

import UIKit

class ViewControllerLifetimeEventsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func willMove(toParentViewController parent: UIViewController?) {
        print("will move ")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
    }
    override func updateViewConstraints() {
        print("updateViewConstraints")
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("traitCollectionDidChange")
    }
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    override func didMove(toParentViewController parent: UIViewController?) {
        print("didMoveToParentViewController")
    }


}
