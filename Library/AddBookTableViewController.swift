//
//  AddBookTableViewController.swift
//  Library
//
//  Created by Matthew McClure on 6/20/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class AddBookTableViewController: UITableViewController {
  
  var newBook: Book!
  var passedSectionArrayOfBooks: [Book]!
  
  @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
    //passedSectionArrayOfBooks.removeAtIndex(indexPath)
    dismissViewControllerAnimated(true, completion: nil)
  }
  @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
    newBook.title         = titleField!.text
    newBook.author        = authorField!.text
    newBook.numberOfPages = pagesField.text.toInt()!
    passedSectionArrayOfBooks.append(newBook)
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var authorField: UITextField!
  @IBOutlet weak var pagesField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleField.becomeFirstResponder()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
  }

  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3
  }
}
