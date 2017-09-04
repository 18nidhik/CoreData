//
//  College+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Shrinidhi K on 04/09/17.
//  Copyright © 2017 Shrinidhi K. All rights reserved.
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var collegeId: Int32
    @NSManaged public var collegeName: String?
    @NSManaged public var collegeStudents: NSSet?

}

// MARK: Generated accessors for collegeStudents
extension College {

    @objc(addCollegeStudentsObject:)
    @NSManaged public func addToCollegeStudents(_ value: Student)

    @objc(removeCollegeStudentsObject:)
    @NSManaged public func removeFromCollegeStudents(_ value: Student)

    @objc(addCollegeStudents:)
    @NSManaged public func addToCollegeStudents(_ values: NSSet)

    @objc(removeCollegeStudents:)
    @NSManaged public func removeFromCollegeStudents(_ values: NSSet)

}
