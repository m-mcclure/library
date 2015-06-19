//
//  LibraryTableViewController.swift
//  Library
//
//  Created by Matthew McClure on 6/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController, UITableViewDataSource {
  
  var sectionsArray = [Section]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //create add sections to sections array
    let literature = Section(section: "Literature")
    self.sectionsArray.append(literature)
    
    let art = Section(section: "Art")
    self.sectionsArray.append(art)
    
    let music = Section(section: "Music")
    self.sectionsArray.append(music)
    
    let science = Section(section: "Science")
    self.sectionsArray.append(science)
    
    let technology = Section(section: "Technology")
    self.sectionsArray.append(technology)
    
    let history = Section(section: "History")
    self.sectionsArray.append(history)
    
    let philosophy = Section(section: "Philosophy")
    self.sectionsArray.append(philosophy)
    
    let reference = Section(section: "Reference")
    self.sectionsArray.append(reference)
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
    return sectionsArray.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("sectionCell") as! UITableViewCell
    
    // Configure the cell...
    let sectionToDisplay = self.sectionsArray[indexPath.row]
    cell.textLabel!.text = sectionToDisplay.sectionName
    
    return cell
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
