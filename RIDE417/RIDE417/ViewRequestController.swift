//
//  ViewRequestController.swift
//  RIDE417
//
//  Created by ewang on 12/31/15.
//  Copyright © 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit
import Parse

class ViewRequestController: UIViewController {
    @IBOutlet weak var pickupLoc: UITextField!
    
    @IBOutlet weak var dropoffLoc: UITextField!
    
    var rideRequest: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = rideRequest!
        pickupLoc.text = String(request["pickupLoc"]!)
        dropoffLoc.text = String(request["dropoffLoc"]!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}