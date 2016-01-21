//
//  MovieBoxDatabase.swift
//  MovieBox
//
//  Created by Lalit on 2016-01-21.
//  Copyright © 2016 Bagga. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MovieBoxDatabase{
    var fmovieBox = [MovieBox]()
    
    func fetchAndSetResult(){
        let app = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = app?.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "MovieBox")
        do{
            let fetchRequest = try context?.executeFetchRequest(fetchRequest)
            self.fmovieBox = fetchRequest as! [MovieBox]
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
}
