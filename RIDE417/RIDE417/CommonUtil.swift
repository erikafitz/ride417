//
//  CommonUtil.swift
//  RIDE417
//
//  Created by E Wang on 7/28/15.
//  Copyright (c) 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit


var logoPurple : UIColor = UIColor(red: 0.545, green: 0.251, blue: 0.753, alpha: 1.0);
var darkPurple : UIColor = UIColor(red: 0.184, green: 0.082, blue: 0.251, alpha: 1.0);
var mediumPurple : UIColor = UIColor(red: 0.337, green: 0.553, blue: 0.184, alpha: 1.0);
var lightPurple : UIColor = UIColor(red: 0.675, green: 0.502, blue: 0.792, alpha: 1.0);

func displayAlert(title: String, msg: String) {
    let alert = UIAlertView()
    alert.title = title
    alert.message = msg
    alert.addButtonWithTitle("OK")
    alert.show()
    return;
}

func outlineButton(button: UIButton, color: UIColor) {
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = color.CGColor;
    button.layer.cornerRadius = 0;
}

func setPlaceholder(textField: UITextField, text: String, color: UIColor) {
    textField.attributedPlaceholder = NSAttributedString(string: text,
        attributes:[NSForegroundColorAttributeName: color]);
}

func underlineTextField(textField: UITextField, color: UIColor) {
    let border = CALayer()
    let width = CGFloat(2.0)
    border.borderColor = color.CGColor
    border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
    border.borderWidth = width
    textField.layer.addSublayer(border)
    textField.layer.masksToBounds = true
}