//
//  Courses+CoreDataProperties.swift
//  day06ex
//
//  Created by Admin on 10/26/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import Foundation
import CoreData


extension Courses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Courses> {
        return NSFetchRequest<Courses>(entityName: "Courses");
    }

    @NSManaged public var name: String?
    @NSManaged public var numberOfStudents: Int32
    @NSManaged public var contain: NSSet?

}

// MARK: Generated accessors for contain
extension Courses {

    @objc(addContainObject:)
    @NSManaged public func addToContain(_ value: Students)

    @objc(removeContainObject:)
    @NSManaged public func removeFromContain(_ value: Students)

    @objc(addContain:)
    @NSManaged public func addToContain(_ values: NSSet)

    @objc(removeContain:)
    @NSManaged public func removeFromContain(_ values: NSSet)

}
