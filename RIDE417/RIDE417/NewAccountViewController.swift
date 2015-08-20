//
//  NewAccountViewController.swift
//  RIDE417
//
//  Created by Erika Fitzpatrick on 7/27/15.
//  Copyright (c) 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit
import Parse

class NewAccountViewController: UIViewController {

    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var emailAddress: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var passwordConfirmation: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func createAccountButton(sender: AnyObject) {
        let userEmail = emailAddress.text;
        let userPassword = password.text;
        let userPWConfirm = passwordConfirmation.text;
        let userName = name.text;
        let userPhone = phone.text;
        
        //check for empty fields
        if(userEmail.isEmpty || userPassword.isEmpty || userPWConfirm.isEmpty){
            //display alert
            displayMyAlertMessage("All fields are required.");
            return;
        }
        
        //check for valid .edu email
        if(userEmail.rangeOfString("@")==nil || userEmail.rangeOfString(".edu")==nil){
            //display alert
            displayMyAlertMessage("Please use a valid .edu email address.");
        }
        
        //check that passwords match
        if(userPassword != userPWConfirm){
            //display alert
            displayMyAlertMessage("Passwords do not match.");
            return;
        }
        
        //store new user
        var user = PFUser();
        user.username = userEmail;
        user.password = userPassword;
        user.email = userEmail;
        if(!(userEmail.rangeOfString("@missouristate.edu")==nil)){
            user.setObject("Missouri State University", forKey: "school");
        }else if(!(userEmail.rangeOfString("@evangel.edu")==nil)){
            user.setObject("Evangel University", forKey: "school");
        }else{
            user.setObject("unknown", forKey: "school");
        }
        user.setObject(false, forKey: "driver");
        user.setObject(userPhone, forKey: "number");
        user.setObject(userName , forKey: "name");
        user.signUpInBackgroundWithBlock { (succeeded, error) -> Void in
            if error == nil {
                //alert
                var myAlert = UIAlertController(title:"Registration Successful", message:"Sign in to request a ride!", preferredStyle:UIAlertControllerStyle.Alert);
                let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.Default){ action in
                    self.dismissViewControllerAnimated(true, completion: nil);
                }
                myAlert.addAction(okAction);
                self.presentViewController(myAlert,  animated:true, completion:nil);
            } else {
                self.displayMyAlertMessage("Invalid entry. Please double check the form and try again.");
                println("\(error)");
                // Show the errorString somewhere and let the user try again.
            }
        }
        
    }
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle:UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.Default, handler:nil);
        myAlert.addAction(okAction);
        self.presentViewController(myAlert,  animated:true, completion:nil);
    }
    
    @IBAction func backToLoginButton(sender: AnyObject) {
        
    }
}
