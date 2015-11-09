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
        self.groupNameTextField.becomeFirstResponder()
    }
    
    @IBAction func okClicked(sender: AnyObject) {
        let groupName = self.groupNameTextField!.text!
        
        if groupName.isEmpty == true {
            self.showMessageInAlert("É necesário dar um nome ao grupo",
                forTitle: "Atenção",
                shouldDismiss: false)
        } else {
            let group = CNMutableGroup()
            group.name = groupName
            
            let saveRequest = CNSaveRequest()
            saveRequest.addGroup(group, toContainerWithIdentifier:nil)
            
            let store = CNContactStore()            
            do {
                try store.executeSaveRequest(saveRequest)
                self.showMessageInAlert("Grupo criado com sucesso!",
                    forTitle: "Pronto",
                    shouldDismiss: true)
            } catch {
                self.showMessageInAlert("Erro ao criar grupo",
                    forTitle: "Atenção",
                    shouldDismiss: true)
            }
        }
    }

    func showMessageInAlert(message: String, forTitle title: String, shouldDismiss dismiss: Bool) {
        let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel) { (anAction) -> Void in
            if dismiss == true {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        alert.addAction(action)
        presentViewController(alert, animated: true, completion:nil)
    }
    
    @IBAction func cancelClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion:nil)
    }
}
