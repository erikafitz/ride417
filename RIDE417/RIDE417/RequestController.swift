//
//  RequestController.swift
//  RIDE417
//
//  Created by E Wang on 7/12/15.
//  Copyright (c) 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit
import Parse

class RequestController: UIViewController {
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var numberTextField : UITextField!
    @IBOutlet var numPeopleTextField : UITextField!
    @IBOutlet var pickupTextField : UITextField!
    @IBOutlet var dropoffTextField : UITextField!
    
    var requestId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        
    } */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let svc = segue.destinationViewController as! ViewRequestController
        svc.requestId = requestId
    }
    
    @IBAction func sendRequest(sender: UIButton) {
        let name = nameTextField.text
        let number = numberTextField.text
        let numPeople = numPeopleTextField.text
        let pickupLoc = pickupTextField.text
        let dropoffLoc = dropoffTextField.text
        
        if(name!.isEmpty || number!.isEmpty || numPeople!.isEmpty || pickupLoc!.isEmpty
            || dropoffLoc!.isEmpty) {
                displayAlert("Invalid Request", msg: "All fields are required.")
                return
        }
        let rideRequest = PFObject(className:"RideRequest")
        rideRequest["name"] = nameTextField.text
        rideRequest["number"] = numberTextField.text
        if let numPeople = Int(numPeopleTextField.text!) {
            rideRequest["numPeople"] = numPeople;
        }
        rideRequest["pickupLoc"] = pickupTextField.text
        rideRequest["dropoffLoc"] = dropoffTextField.text
        rideRequest["progress"] = "unassigned"
        
        rideRequest.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            // TODO: remove alerts when no longer needed for debugging
            if (success) {
                displayAlert("Success!", msg: "Request sent.")
                self.requestId = rideRequest.objectId!
                self.performSegueWithIdentifier("requestSegue", sender: self)
                return
            } else {
                displayAlert("Request failed", msg: "Something went wrong.")
                return
            }
        }
    }
}
