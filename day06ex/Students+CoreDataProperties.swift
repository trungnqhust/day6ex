//
//  Students+CoreDataProperties.swift
//  day06ex
//
//  Created by Admin on 10/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import Foundation
import CoreData

extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students");
    }

    @NSManaged public var address: String?
    @NSManaged public var birthday: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var name: String?
    @NSManaged public var belong: NSSet?

}

// MARK: Generated accessors for belong
extension Students {

    @objc(addBelongObject:)
    @NSManaged public func addToBelong(_ value: Courses)

    @objc(removeBelongObject:)
    @NSManaged public func removeFromBelong(_ value: Courses)

    @objc(addBelong:)
    @NSManaged public func addToBelong(_ values: NSSet)

    @objc(removeBelong:)
    @NSManaged public func removeFromBelong(_ values: NSSet)

}
