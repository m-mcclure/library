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
  
  @IBAction func checkoutOrReturnButton(sender: UIButton) {
    selectedBook.isCheckedOut = !selectedBook.isCheckedOut
    if selectedBook.isCheckedOut == false {
      bookStatus.text = "Book is available"
    } else {
      bookStatus.text = "Book is checked out"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text  = selectedBook.title
    authorLabel.text = "by \(selectedBook.author)"
    
    if selectedBook.isCheckedOut == false {
      bookStatus.text = "Book is available"
    } else {
      bookStatus.text = "Book is checked out"
    }
  }

  
}
