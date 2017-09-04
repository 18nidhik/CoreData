//
//  Student+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Shrinidhi K on 04/09/17.
//  Copyright © 2017 Shrinidhi K. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var studentId: Int32
    @NSManaged public var studentName: String?
    @NSManaged public var studentCollege: College?

}
