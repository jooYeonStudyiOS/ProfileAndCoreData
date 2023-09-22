//
//  TaskEntity+CoreDataProperties.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/22.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var createData: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isComplited: Bool
    @NSManaged public var modifyData: Date?
    @NSManaged public var title: String?

}

extension TaskEntity : Identifiable {

}
