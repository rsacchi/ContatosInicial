//
//  Person.swift
//  Contatos
//
//  Created by Rafael Sacchi on 11/1/15.
//  Copyright © 2015 Rafael Sacchi. All rights reserved.
//

import UIKit

public class Person: NSObject {
    public var givenName : String?
    public var familyName : String?
    public var profilePicture : UIImage?
    
    public var homeEmail : String?
    public var workEmail : String?

    public var mobilePhone : String?
    public var workPhone : String?
    public var fathersPhone : String?
    
    public var birthdayDate : NSDateComponents?
}
