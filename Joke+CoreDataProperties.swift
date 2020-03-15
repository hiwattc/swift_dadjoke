//
//  Joke+CoreDataProperties.swift
//  parctice01
//
//  Created by hiwatt on 2020/03/15.
//  Copyright © 2020 hiwatt. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var setup: String?
    @NSManaged public var rating: String?
    @NSManaged public var punchline: String?

}
