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
    
    var waitMsg: String = "Waiting to be assigned a driver...\n"
    var foundMsg: String = "Found a driver.\n"
    
    var requestId: String = ""
    var request: PFObject?
    var timer: NSTimer = NSTimer()
    var updateSeconds: Double = 10.0
    var assigned: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (requestId == "") {
            displayAlert("Error", msg: "Could not send request")
        }
        print(requestId)
        let requestQuery = PFQuery(className: "RideRequest")
        requestQuery.getObjectInBackgroundWithId(requestId) {
            (request: PFObject?, error: NSError?) -> Void in
            self.request = request
            self.pickupLabel.text = request!["pickupLoc"] as? String
            self.dropoffLabel.text = request!["dropoffLoc"] as? String
            if request!["progress"] as? String == "unassigned" {
                self.notificationsLabel.text = self.waitMsg
            } else {
                self.assigned = true
                self.notificationsLabel.text = self.foundMsg
            }
            // TODO: use push notifications instead of constant checks for updates
            self.timer = NSTimer.scheduledTimerWithTimeInterval(self.updateSeconds, target: self, selector: "updateStatus", userInfo: nil, repeats: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateStatus() {
        // This closure must be able to be run a few extra times
        request?.fetchInBackgroundWithBlock() {
            (request: PFObject?, error: NSError?) -> Void in
            var progress = request!["progress"] as? String
            if progress == nil {
                return
            }
            progress = progress!
            if (progress == "assigned") {
                if !self.assigned {
                    self.assigned = true
                    
                    // Note: notifications label will not be empty.
                    self.notificationsLabel.text! += self.foundMsg
                }

                // Show list of notifications.
                let notificationsList = request!["messages"] as? Array<String>
                self.notificationsLabel.text = self.foundMsg
                if notificationsList != nil {
                    for msg in notificationsList! {
                        self.notificationsLabel.text! += msg
                    }
                }

                // Update eta
                self.etaLabel.text = request!["driverEta"] as? String
                
            } else if (progress == "pickedUp") {
                self.timer.invalidate()
            }
        }
    }
}