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
  var sameSelectedLibrary: Library!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = selectedSection.sectionName
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
      let checkedOutColor = UIColor(red: 220.0/255.0, green: 73.0/255.0, blue: 71.0/255.0, alpha: 1)
      cell.detailTextLabel!.textColor = checkedOutColor
      cell.detailTextLabel!.text = "Checked Out"
    }
    return cell
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    //remove most recently added 'empty' book if user doesn't at least enter title and author data
    let indexPath = selectedSection.booksInSection.count - 1
    if (selectedSection.booksInSection[indexPath].title == "" || selectedSection.booksInSection[indexPath].author == "") {
    selectedSection.booksInSection.removeAtIndex(indexPath)
    }
    self.tableView.reloadData()
  }
  
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if (editingStyle == UITableViewCellEditingStyle.Delete) {
      selectedSection.booksInSection.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "AddBook" {
      let nav = segue.destinationViewController as! UINavigationController
      let addBookTableViewController = nav.topViewController as! AddBookTableViewController
      let newBook = Book(title: "", author: "", numberOfPages: 0)
      selectedSection.booksInSection.append(newBook)
      let passedSectionArrayOfBooks = selectedSection.booksInSection
      addBookTableViewController.newBook = newBook
      addBookTableViewController.passedSectionArrayOfBooks = passedSectionArrayOfBooks
      
    } else if segue.identifier == "ShowBookDetail" {
      let nav = segue.destinationViewController as! UINavigationController
      let booksDetailViewController = nav.topViewController as! BookDetailViewController
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedBook = selectedSection.booksInSection[selectedRow]
      booksDetailViewController.selectedBook = selectedBook
    }
  }
}
