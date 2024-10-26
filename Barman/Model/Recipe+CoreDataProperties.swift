//
//  Recipe+CoreDataProperties.swift
//  Barman
//
//  Created by OYuuyuMP on 25/10/24.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var directions: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var name: String?
    @NSManaged public var image: String?

}

extension Recipe : Identifiable {

}
