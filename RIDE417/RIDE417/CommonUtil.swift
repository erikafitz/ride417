//
//  CommonUtil.swift
//  RIDE417
//
//  Created by E Wang on 7/28/15.
//  Copyright (c) 2015 Erika Fitzpatrick. All rights reserved.
//

import UIKit

func displayAlert(title: String, msg: String) {
    let alert = UIAlertView()
    alert.title = title
    alert.message = msg
    alert.addButtonWithTitle("OK")
    alert.show()
    return;
}