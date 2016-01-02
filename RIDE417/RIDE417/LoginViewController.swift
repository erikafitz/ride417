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
    @IBOutlet var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
        outlineButton(createButton, color:logoPurple);
        setPlaceholder(emailAddress, text: "email address", color: lightPurple);
        setPlaceholder(password, text: "password", color: lightPurple);
        underlineTextField(emailAddress, color: darkPurple);
        underlineTextField(password, color: darkPurple);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        let userEmail = emailAddress.text;
        let userPassword = password.text;
        
        
        PFUser.logInWithUsernameInBackground(userEmail!, password: userPassword!, block: {(user, error) -> Void in
            if ((user) != nil) {
                self.dismissViewControllerAnimated(true, completion: nil);
            }else {
                let alert = UIAlertView(title: "Error", message: "Email and password combination does not exist.", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
        })
    }
}
