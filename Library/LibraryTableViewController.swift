//
//  LibraryTableViewController.swift
//  Library
//
//  Created by Matthew McClure on 6/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController, UITableViewDataSource {
  
  var libraries = [Library]()
 
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //create library branches and append to library array
    let ballard = Library(name: "Ballard", address: "322 Maple Street", hoursOp: "9:00-21:00")
    libraries.append(ballard)
    
    let capitolHill = Library(name: "Capitol Hill", address: "1443 E. Pike Street", hoursOp: "9:00-20:00")
    libraries.append(capitolHill)
    
    let columbia = Library(name: "Columbia", address: "444 Main Street", hoursOp: "9:00-20:00")
    libraries.append(columbia)
    
    let fremont = Library(name: "Fremont", address: "731 N. 35th St.", hoursOp: "9:00-15:00")
    libraries.append(fremont)
    
    let magnolia = Library(name: "Magnolia", address: "2490 Elm St.", hoursOp: "8:00-20:00")
    libraries.append(magnolia)
    
    let queenAnne = Library(name: "Queen Anne", address: "456 Park Avenue", hoursOp: "8:00-15:00")
    libraries.append(queenAnne)
    
    let rainierBeach = Library(name: "Rainier Beach", address: "24 Pine Avenue", hoursOp: "10:00-20:00")
    libraries.append(rainierBeach)
    
    let sLU = Library(name: "South Lake Union", address: "512 Boren Ave N.", hoursOp: "10:00-18:00")
    libraries.append(sLU)
    
    let wallingford = Library(name: "Wallingford", address: "3440 Almeda St.", hoursOp: "9:00-21:00")
    libraries.append(wallingford)
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return libraries.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("libraryCell") as! UITableViewCell
    
    // Configure the cell...
    let libraryToDisplay = self.libraries[indexPath.row]
    cell.textLabel!.text = libraryToDisplay.name
    return cell
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    let nav = segue.destinationViewController as! UINavigationController
    let sectionsController = nav.topViewController as! SectionsTableViewController
    let indexPath = self.tableView.indexPathForSelectedRow()
    let selectedRow = indexPath!.row
    let selectedLibrary = self.libraries[selectedRow]
    sectionsController.selectedLibrary = selectedLibrary
  }
}
