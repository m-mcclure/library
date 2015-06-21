//
//  EditBookTableViewController.swift
//  Library
//
//  Created by Matthew McClure on 6/21/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class EditBookTableViewController: UITableViewController, UITextFieldDelegate,UINavigationControllerDelegate {
  var bookForEdit: Book!
  var passedSectionArrayOfBooks: [Book]!
  var bookToPassBack: Book!
  
  @IBOutlet weak var doneEditing: UIBarButtonItem!
  
  
  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var authorField: UITextField!
  @IBOutlet weak var pagesField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleField.becomeFirstResponder()
    
    self.titleField.delegate = self
    self.authorField.delegate = self
    self.pagesField.delegate = self 

    self.titleField.tag = 0
    self.authorField.tag = 1
    self.pagesField.tag = 2
    
    self.titleField.text = self.bookForEdit.title
    self.authorField.text = self.bookForEdit.author
    //self.pagesField = self.bookForEdit.numberOfPages
  }
  
  func textFieldDidEndEditing(textField: UITextField){
    if textField.tag == 0 {
      self.bookForEdit.title = titleField.text
    } else if textField.tag == 1 {
      self.bookForEdit.author = authorField.text
    } /*else if textField.tag == 2 {
      self.selectedPerson.twitter = textField.text
    }*/
    println(bookForEdit.title)
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
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
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3
  }
  
  @IBAction func unwindToMainMenu(sender: UIStoryboardSegue)
  {
    let sourceViewController: AnyObject = sender.sourceViewController
    // Pull any data from the view controller which initiated the unwind segue.
    bookToPassBack = bookForEdit
  }
}
