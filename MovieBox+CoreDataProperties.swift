//
//  MovieBox+CoreDataProperties.swift
//  MovieBox
//
//  Created by Lalit on 2016-01-20.
//  Copyright © 2016 Bagga. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MovieBox {

    @NSManaged var title: String?
    @NSManaged var descriptions: String?
    @NSManaged var image: NSData?

}
