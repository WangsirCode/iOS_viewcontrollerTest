//
//  PresentedController.swift
//  ViewControllerTest
//
//  Created by 汪宇豪 on 2016/11/3.
//  Copyright © 2016年 汪宇豪. All rights reserved.
//

import UIKit

class PresentedController: UIViewController {

    var index:String?
    @IBOutlet weak var bt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bt.setTitle(self.index, for: .normal)
        // Do any aditional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        self.view.removeFromSuperview()
        let controler = PresentedController()
        self.parent?.transition(from: self, to: controler, duration: 1, options: .curveEaseInOut, animations: nil, completion: { (diid) in
            self.parent?.addChildViewController(controler)
        })
        self.removeFromParentViewController()
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
