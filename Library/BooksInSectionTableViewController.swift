//
//  BooksInSectionTableViewController.swift
//  Library
//
//  Created by Matthew McClure on 6/20/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class BooksInSectionTableViewController: UITableViewController, UINavigationControllerDelegate, UITableViewDataSource {
  
  var selectedSection: Section!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = selectedSection.sectionName
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedSection.booksInSection.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath) as! UITableViewCell
    
    let bookToDisplay = self.selectedSection.booksInSection[indexPath.row]
    
    // Configure the cell...
    cell.textLabel!.text = bookToDisplay.title
    if bookToDisplay.isCheckedOut == false {
      let beryl = UIColor(red: 100.0/255.0, green: 215.0/255.0, blue: 190.0/255.0, alpha: 1.0)
      cell.detailTextLabel!.textColor = beryl
      cell.detailTextLabel!.text = "Available"
    } else {
      let checkedOutColor = UIColor(red: 255.0/255.0, green: 121.0/255.0, blue: 112.0/255.0, alpha: 1)
      cell.detailTextLabel!.textColor = checkedOutColor
      cell.detailTextLabel!.text = "Checked Out"
    }
    return cell
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "AddBook" {
      println("fuck all")
      
    } else if segue.identifier == "ShowBookDetail" {
      let nav = segue.destinationViewController as! UINavigationController
      let booksDetailViewController = nav.topViewController as! BookDetailViewController
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedBook = selectedSection.booksInSection[selectedRow]
      booksDetailViewController.selectedBook = selectedBook
    }
  }
  
  /*
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
  
  // Configure the cell...
  
  return cell
  }
  */
  
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
