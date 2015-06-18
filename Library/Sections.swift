//
//  Sections.swift
//  Library
//
//  Created by Matthew McClure on 6/18/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

class Section {
  var sectionName : String
  var booksInSection = []
  
  init (section: String) {
    self.sectionName = section 
  }
}