//
//  LoginViewController.swift
//  RIDE417
//
//  Created by Erika Fitzpatrick on 7/27/15.
//  Copyright (c) 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet var emailAddress: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        let userEmail = emailAddress.text;
        let userPassword = password.text;
        
        
        PFUser.logInWithUsernameInBackground(userEmail, password: userPassword, block: {(user, error) -> Void in
            if ((user) != nil) {
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isLoggedIn");
                NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail");
                NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil);
            }else {
                var alert = UIAlertView(title: "Error", message: "Email and password combination does not exist.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        })
    }
}
