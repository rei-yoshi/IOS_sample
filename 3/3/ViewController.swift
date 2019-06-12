//
//  ViewController.swift
//  3
//
//  Created by 吉田れい on 2019/06/12.
//  Copyright © 2019 吉田れい. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func botantap(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "FirstViewController", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        self.present(nextView!, animated: true, completion: nil)
    }
}

