//
//  Book.swift
//  Library
//
//  Created by Matthew McClure on 6/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

class Book {
  var title: String
  var author: String
  var numberOfPages: Int
  var isbn10Code: Int
  var isCheckedOut = false
  
  init(title: String, author: String, numberOfPages: Int, isbn10Code: Int){
    self.title         = title
    self.author        = author
    self.numberOfPages = numberOfPages
    self.isbn10Code    = isbn10Code
  }
}