//
//  MovieBoxCell.swift
//  MovieBox
//
//  Created by Lalit on 2016-01-21.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit

class MovieBoxCell: UITableViewCell {
    
    @IBOutlet weak var images:UIImageView!
    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var descriptions:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        images.layer.cornerRadius = images.frame.width / 2
        images.clipsToBounds = true
    }
    
    func configureCell(movie:MovieBox){
        title.text = movie.title
        descriptions.text = movie.descriptions
        images.image = movie.getMovieImages()
    }

   

}
