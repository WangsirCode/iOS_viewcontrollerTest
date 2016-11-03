//
//  StatusBarController.swift
//  ViewControllerTest
//
//  Created by 汪宇豪 on 2016/11/3.
//  Copyright © 2016年 汪宇豪. All rights reserved.
//

import UIKit

class StatusBarController: UIViewController {

    var hide = false
    @IBAction func doButton(_ sender: Any) {
        self.hide = !self.hide
        UIView.animate(withDuration: 1, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
            self.view.layoutIfNeeded()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var prefersStatusBarHidden: Bool
        {
            return self.hide
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation
        {
            return .fade
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
    override func viewWillLayoutSubviews() {
        
    }
    override func viewDidLayoutSubviews() {

    }
    

}
