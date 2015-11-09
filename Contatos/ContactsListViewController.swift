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
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
    }

}

