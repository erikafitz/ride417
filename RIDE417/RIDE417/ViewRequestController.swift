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
    @IBOutlet var pickupLabel: UILabel!
    @IBOutlet var dropoffLabel: UILabel!
    @IBOutlet var notificationsLabel: UILabel!
    @IBOutlet var etaLabel: UILabel!
    
    var rideRequest: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = rideRequest!
        pickupLabel.text = String(request["pickupLoc"]!)
        dropoffLabel.text = String(request["dropoffLoc"]!)
        updateStatus()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateStatus() {
        notificationsLabel.text = "Waiting to be assigned a driver..."
    }
}