//
//  CreateMovie.swift
//  MovieBox
//
//  Created by Lalit on 2016-01-21.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit
import CoreData

class CreateMovie: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var titles:UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var img: UIImageView!
    
    var imagePicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        img.layer.cornerRadius = img.frame.width/2
        img.clipsToBounds = true

    }
    @IBAction func onAddMoviePressesd(sender:AnyObject!){
        if let title = titles.text where title != ""{
            let app = UIApplication.sharedApplication().delegate as? AppDelegate
            let context = app?.managedObjectContext
            let entity = NSEntityDescription.entityForName("MovieBox", inManagedObjectContext: context!)!
            let movie = MovieBox(entity:entity , insertIntoManagedObjectContext: context)
            movie.title = titles.text
            movie.descriptions = desc.text
            movie.setMovieImages(img.image!)
            context?.insertObject(movie)
            do{
                try context?.save()
            }catch{
                print("Could not save Movie")
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    @IBAction func onAddImagePressed(sender:AnyObject!){
        presentViewController(imagePicker, animated: true, completion: nil)
        sender.setTitle("", forState: .Normal)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        img.image = image
    }

    


}
