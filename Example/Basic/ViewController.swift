//
//  ViewController.swift
//  Basic
//
//  Created by mansoor92 on 11/08/2018.
//  Copyright (c) 2018 mansoor92. All rights reserved.
//

import UIKit
import Basic

class ViewController: UIViewController {

	@IBOutlet weak var fieldPhone: UITextField!
	@IBOutlet weak var fieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

	@IBAction func didChangeText(_ sender: ValidationMsgTextField) {
		let status: InputValidationStatus
		if sender == fieldPhone, sender.text!.isValid(forExp: RegularExpression.phone.rawValue) {
			status = InputValidationStatus.valid
		}else if sender == fieldPassword,  sender.text!.isValid(forExp: RegularExpression.password.rawValue){
			status = InputValidationStatus.valid
		}else {
			status = InputValidationStatus.invalid("Inavlid")
		}
		sender.set(validationStatus: status)
	}

}

