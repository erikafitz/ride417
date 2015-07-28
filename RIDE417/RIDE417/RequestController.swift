//
//  RequestController.swift
//  RIDE417
//
//  Created by E Wang on 7/12/15.
//  Copyright (c) 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit

class RequestController: UIViewController {
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var numberTextField : UITextField!
    @IBOutlet var numPeopleTextField : UITextField!
    @IBOutlet var pickupTextField : UITextField!
    @IBOutlet var dropoffTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
    }
    
}
