//
//  Recipe+CoreDataClass.swift
//  Barman
//
//  Created by OYuuyuMP on 25/10/24.
//
//

import Foundation
import CoreData

@objc(Recipe)
public class Recipe: NSManagedObject {
    func initilizeWith(_ dict: Dictionary<String, Any>) {
        let name = dict["name"] as? String ?? ""
        let image = dict["img"] as? String ?? ""
        let ingredients = dict["ingredients"] as? String ?? ""
        let instructions = dict["directions"] as? String ?? ""
        
        self.name = name
        self.image = image
        self.ingredients = ingredients
        self.directions = instructions
    }
}
