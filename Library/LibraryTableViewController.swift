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
  
  var standardSections = [Section]()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let literature = Section(section: "Literature")
    standardSections.append(literature)
    
    let art = Section(section: "Art")
    standardSections.append(art)
    
    let music = Section(section: "Music")
    standardSections.append(music)
    
    let science = Section(section: "Science")
    standardSections.append(science)
    
    let technology = Section(section: "Technology")
    standardSections.append(technology)
    
    let philosophy = Section(section: "Philosophy")
    standardSections.append(philosophy)
    
    let history = Section(section: "History")
    standardSections.append(history)
    
    let reference = Section(section: "Reference")
    standardSections.append(reference)
    
    let ballard = Library(name: "Ballard", address: "322 Maple Street", hoursOp: "9:00-21:00", sections: standardSections)
    libraries.append(ballard)
    
    let capitolHill = Library(name: "Capitol Hill", address: "1443 E. Pike Street", hoursOp: "9:00-20:00", sections: standardSections)
    libraries.append(capitolHill)
    
    let queenAnne = Library(name: "Queen Anne", address: "456 Park Avenue", hoursOp: "8:00-15:00", sections: standardSections)
    libraries.append(queenAnne)
    
    let sLU = Library(name: "South Lake Union", address: "512 Boren Ave N.", hoursOp: "10:00-18:00", sections: standardSections)
    libraries.append(sLU)

    
    println(ballard.sections.count)
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
    let sectionToDisplay = self.libraries[indexPath.row]
    cell.textLabel!.text = sectionToDisplay.name
    
    return cell
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
    println(selectedLibrary.name)
    
  }
  
  
  
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return NO if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return NO if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
  
}
