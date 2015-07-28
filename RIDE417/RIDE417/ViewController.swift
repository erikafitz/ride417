//
//  ViewController.swift
//  RIDE417
//
//  Created by Erika Fitzpatrick on 7/27/15.
//  Copyright (c) 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("loginView", sender:self)
    }


}

