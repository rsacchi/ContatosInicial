//
//  AddGroupViewController.swift
//  Contatos
//
//  Created by Rafael Sacchi on 11/8/15.
//  Copyright © 2015 Rafael Sacchi. All rights reserved.
//

import UIKit
import Contacts

class AddGroupViewController: UIViewController {

    @IBOutlet var groupNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func okClicked(sender: AnyObject) {
    }

    func showMessageInAlert(message: String, forTitle title: String, shouldDismiss dismiss: Bool) {
    }
    
    @IBAction func cancelClicked(sender: AnyObject) {
    }
}
