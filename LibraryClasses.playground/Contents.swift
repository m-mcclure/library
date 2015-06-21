//: The submission page asked for a single URL, so I copied and pasted each of my separate class files into this playground for convenience. You can find the same classes within the XCode project provided in subsequent links.

import UIKit

class Library {
  var name: String
  var address: String
  var hoursOfOperation: String
  var sections = [Section]()
  func listAllBooksInLibrary() {
    println("Complete list of books in the \(self.name) collection: ")
    for section in sections {
      for book in section.booksInSection {
        println(book.title)
      }
    }
  }
  
  init(name: String, address: String, hoursOp: String){
    self.name             = name
    self.address          = address
    self.hoursOfOperation = hoursOp
  }
}

class Section {
  var sectionName : String
  var booksInSection = [Book]()
  
  init (section: String) {
    self.sectionName = section
  }
}

class Book {
  var title: String
  var author: String
  var numberOfPages: Int
  var isCheckedOut = false
  
  init(title: String, author: String, numberOfPages: Int){
    self.title         = title
    self.author        = author
    self.numberOfPages = numberOfPages
  }
}