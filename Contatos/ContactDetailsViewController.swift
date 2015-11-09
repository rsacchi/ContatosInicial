//
//  ContactDetailsViewController.swift
//  Contatos
//
//  Created by Rafael Sacchi on 10/13/15.
//  Copyright © 2015 Rafael Sacchi. All rights reserved.
//

import UIKit
import Contacts

class ContactDetailsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var personList = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        createPersons()
    }
    
    func createPersons() {
        var p = Person()
        p.givenName = "João"
        p.familyName = "Silva"
        p.workEmail = "joao@work.com"
        p.workPhone = "+55 (19) 99999-9999)"
        p.homeEmail = "joao@home.com"
        p.mobilePhone = "+55 (19) 99999-9998)"
        p.fathersPhone = "+55 (19) 99999-9997)"
        p.profilePicture = UIImage(named: "man_0")
        
        var birthday = NSDateComponents()
        birthday.day = 1
        birthday.month = 1
        birthday.year = 1970
        p.birthdayDate = birthday
        personList.append(p)
        
        p = Person()
        p.givenName = "Marina"
        p.familyName = "Fontes"
        p.workEmail = "marina@work.com"
        p.workPhone = "+55 (19) 99999-9989)"
        p.homeEmail = "marina@home.com"
        p.mobilePhone = "+55 (19) 99999-9988)"
        p.fathersPhone = "+55 (19) 99999-9987)"
        p.profilePicture = UIImage(named: "woman_0")
        
        birthday = NSDateComponents()
        birthday.day = 22
        birthday.month = 10
        birthday.year = 1976
        p.birthdayDate = birthday
        personList.append(p)
        
        p = Person()
        p.givenName = "Otávio"
        p.familyName = "da Silva"
        p.workEmail = "otavio@work.com"
        p.workPhone = "+55 (19) 99999-9979)"
        p.homeEmail = "otavio@home.com"
        p.mobilePhone = "+55 (19) 99999-9978)"
        p.fathersPhone = "+55 (19) 99999-9977)"
        p.profilePicture = UIImage(named: "man_1")
        
        birthday = NSDateComponents()
        birthday.day = 12
        birthday.month = 8
        birthday.year = 1992
        p.birthdayDate = birthday
        personList.append(p)
        
        p = Person()
        p.givenName = "Patrícia"
        p.familyName = "Nunes"
        p.workEmail = "patricia@work.com"
        p.workPhone = "+55 (19) 99999-9969)"
        p.homeEmail = "patricia@home.com"
        p.mobilePhone = "+55 (19) 99999-9968)"
        p.fathersPhone = "+55 (19) 99999-9967)"
        p.profilePicture = UIImage(named: "woman_1")
        
        birthday = NSDateComponents()
        birthday.day = 20
        birthday.month = 6
        birthday.year = 1949
        p.birthdayDate = birthday
        personList.append(p)
    }
    
    func addContact(person: Person) {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        cell!.imageView!.layer.cornerRadius = cell!.imageView!.frame.size.width/2
        cell!.imageView!.clipsToBounds = true
        let p = personList[indexPath.row]
        displayPerson(p, cell: cell!)
        
        return cell!
    }
    
    func displayPerson(person: Person, cell: UITableViewCell) {
        cell.textLabel!.text = person.givenName! + " " + person.familyName!
        cell.imageView!.image = person.profilePicture
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let p = personList[indexPath.row]
        addContact(p)
        showSucessfulMessageAfterAddingContact()
    }
    
    func showSucessfulMessageAfterAddingContact() {
        let successAlert = UIAlertController(title: "Pronto",
            message: "Contato adicionado",
            preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel) { (anAction) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        successAlert.addAction(action)
        presentViewController(successAlert, animated: true, completion:nil)
    }
    
    @IBAction func cancelClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion:nil)        
    }
}
