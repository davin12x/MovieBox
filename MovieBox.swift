//
//  MovieBox.swift
//  MovieBox
//
//  Created by Lalit on 2016-01-20.
//  Copyright © 2016 Bagga. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MovieBox: NSManagedObject {
    
    func setMovieImages(img : UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    func getMovieImages()->UIImage{
        let img = UIImage(data: self.image!)!
        return img
    }

}
