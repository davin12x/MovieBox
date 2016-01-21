//
//  DetailViewController.swift
//  MovieBox
//
//  Created by Lalit on 2016-01-21.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titles: UILabel!
    @IBOutlet weak var desc : UILabel!
    @IBOutlet weak var img : UIImageView!
    
    var numberOfCell = 0
 
    
    let movieBox = MovieBoxDatabase()

    override func viewDidLoad() {
        super.viewDidLoad()
        

      
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        movieBox.fetchAndSetResult()
        titles.text = movieBox.fmovieBox[numberOfCell].title
        desc.text = movieBox.fmovieBox[numberOfCell].descriptions
        img.image = movieBox.fmovieBox[numberOfCell].getMovieImages()
        
    }

   
 

}
