//
//  ViewController.swift
//  Contatos
//
//  Created by Rafael Sacchi on 10/11/15.
//  Copyright © 2015 Rafael Sacchi. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ContactsListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private var contactsList = [CNContact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        fetchUserContactsAndReloadTableView()
    }
    
    func fetchUserContactsAndReloadTableView() {
        let descriptor = CNContactViewController.descriptorForRequiredKeys()
        let keysToFetch = [descriptor]

        let fetchRequest = CNContactFetchRequest( keysToFetch: keysToFetch)
        CNContact.localizedStringForKey(CNLabelPhoneNumberiPhone)
        
        fetchRequest.mutableObjects = false
        fetchRequest.unifyResults = true
        fetchRequest.sortOrder = .GivenName
        
        do {

            try CNContactStore().enumerateContactsWithFetchRequest(fetchRequest) { (contact, stop) -> Void in
                self.contactsList.append(contact)
            }
        } catch {
            let noPermissionAlert = UIAlertController(title: "Não foi possível adicionar o contato",
                message: "Para adicioná-lo, dê permissão para acessar os Contatos",
                preferredStyle: .Alert)
            
            noPermissionAlert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            
            presentViewController(noPermissionAlert, animated: true, completion: nil)
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        cell!.imageView!.layer.cornerRadius = cell!.imageView!.frame.size.width/2
        cell!.imageView!.clipsToBounds = true
        let c = contactsList[indexPath.row]
        displayContact(c, cell: cell!)
        
        return cell!
    }
    
    func displayContact(contact: CNContact, cell: UITableViewCell) {
        cell.textLabel!.text = CNContactFormatter.stringFromContact(contact, style: .FullName)
        if (contact.imageData != nil) {
            cell.imageView!.image = UIImage(data: contact.imageData!)
        } else {
            cell.imageView!.image = nil
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contact = contactsList[indexPath.row]
        let contactViewController = CNContactViewController(forContact: contact)
        showViewController(contactViewController, sender: self)
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            performDeleteForContactAtIndexPath(indexPath)
        }
    }
    
    func performDeleteForContactAtIndexPath(indexPath: NSIndexPath) {
        let contact = contactsList.removeAtIndex(indexPath.row)
        
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.deleteContact(contact.mutableCopy() as! CNMutableContact)
        
        do {
            try store.executeSaveRequest(saveRequest)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        } catch let error {
            print(error)
            let noPermissionAlert = UIAlertController(title: "Erro",
                message: "Não foi possível deletar o contato selecionado",
                preferredStyle: .Alert)
            noPermissionAlert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            presentViewController(noPermissionAlert, animated: true, completion: nil)
        }
    }

}

