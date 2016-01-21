//
//  ViewController.swift
//  MovieBox
//
//  Created by Lalit on 2016-01-20.
//  Copyright © 2016 Bagga. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var movies=[MovieBox]()
    var valueToPass:String!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResult()
        tableView.reloadData()
    }
    func fetchAndSetResult(){
        let app = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = app?.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "MovieBox")
        do{
            let fetchRequest = try context?.executeFetchRequest(fetchRequest)
            self.movies = fetchRequest as! [MovieBox]
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 159
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieBoxCell") as? MovieBoxCell{
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        }else{
            return MovieBoxCell()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let cell = sender as? UITableViewCell
        {
            let selectedRow = tableView.indexPathForCell(cell)!.row
            if segue.identifier == "DetailViewController"
            {
                let detailViewController = segue.destinationViewController as? DetailViewController
                detailViewController?.numberOfCell = selectedRow
            }
        }
        

    }


}

