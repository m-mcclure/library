//
//  BookDetailViewController.swift
//  Library
//
//  Created by Matthew McClure on 6/20/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, UINavigationControllerDelegate  {
  
  var selectedBook: Book!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var bookStatus: UILabel!
  @IBOutlet weak var checkOutButton: UIButton!
  @IBOutlet weak var returnBookButton: UIButton!
  
  @IBAction func checkoutOrReturnButton(sender: UIButton) {
    selectedBook.isCheckedOut = !selectedBook.isCheckedOut
    if selectedBook.isCheckedOut == false {
      bookStatus.text = "Book is available"
      checkOutButton.hidden = false
      returnBookButton.hidden = true
    } else {
      bookStatus.text = "Book is checked out"
      checkOutButton.hidden = true
      returnBookButton.hidden = false
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text  = selectedBook.title
    authorLabel.text = "by \(selectedBook.author)"
    
    if selectedBook.isCheckedOut == false {
      bookStatus.text = "Book is available"
      checkOutButton.hidden = false
      returnBookButton.hidden = true
    } else {
      bookStatus.text = "Book is checked out"
      checkOutButton.hidden = true
      returnBookButton.hidden = false
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if selectedBook.isCheckedOut == false {
      bookStatus.text = "Book is available"
      checkOutButton.hidden = false
      returnBookButton.hidden = true
    } else {
      bookStatus.text = "Book is checked out"
      checkOutButton.hidden = true
      returnBookButton.hidden = false
    }
  }

  
}
