//
//  Library.swift
//  Library
//
//  Created by Matthew McClure on 6/19/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import Foundation

class Library {
  var name: String
  var address: String
  var hoursOfOperation: String
  var sections = [Section]()
  
  init(name: String, address: String, hoursOp: String/*, sections: Array<Section>*/){
    self.name             = name
    self.address          = address
    self.hoursOfOperation = hoursOp
    //self.sections         = sections
  }
}

