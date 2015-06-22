//
//  SectionsTableViewController.swift
//  Library
//
//  Created by Matthew McClure on 6/19/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

import UIKit

class SectionsTableViewController: UITableViewController, UINavigationControllerDelegate, UITableViewDataSource {
  
  var selectedLibrary: Library!
  var defaultSections = [Section]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "\(selectedLibrary.name)'s Collection"
    
    //create library sections and append to sections array
    let art        = Section(section: "Art")
    defaultSections.append(art)
    
    let fiction    = Section(section: "Fiction")
    defaultSections.append(fiction)
    
    let history    = Section(section: "History")
    defaultSections.append(history)
    
    let music      = Section(section: "Music")
    defaultSections.append(music)
    
    let philosophy = Section(section: "Philosophy")
    defaultSections.append(philosophy)
    
    let reference  = Section(section: "Reference")
    defaultSections.append(reference)
    
    let science    = Section(section: "Science")
    defaultSections.append(science)
    
    let technology = Section(section: "Technology")
    defaultSections.append(technology)
    
    selectedLibrary.sections = defaultSections
    
    //default books placed in each art section:
    let picassosBluePeriod = Book(title: "Picasso's Blue Period", author: "Melora Walters", numberOfPages: 245)
    art.booksInSection.append(picassosBluePeriod)
    
    let deKooning = Book(title: "Willem De Kooning: A Retrospective", author: "Paul Thompson", numberOfPages: 199)
    deKooning.isCheckedOut = true
    art.booksInSection.append(deKooning)
    
    let seventeenthCentury = Book(title: "Masters of the 17th Century", author: "Violet Williams", numberOfPages: 411)
    art.booksInSection.append(seventeenthCentury)
    
    //default books in each fiction section:
    let theHobbit = Book(title: "The Hobbit", author: "J.R.R. Tolkien", numberOfPages: 442)
    fiction.booksInSection.append(theHobbit)
    
    let braveNewWorld = Book(title: "Brave New World", author: "Aldous Huxley", numberOfPages: 227)
    braveNewWorld.isCheckedOut = true
    fiction.booksInSection.append(braveNewWorld)
    
    let nineteenEightyFour = Book(title: "1984", author: "George Orwell", numberOfPages: 304)
    nineteenEightyFour.isCheckedOut = true
    fiction.booksInSection.append(nineteenEightyFour)
    
    let aTaleOf2Cities = Book(title: "A Tale of Two Cities", author: "Charles Dickens", numberOfPages: 545)
    fiction.booksInSection.append(aTaleOf2Cities)
    
    let talesFromTheFarSide = Book(title: "Tales from the Far Side", author: "Gary Larson", numberOfPages: 202)
    fiction.booksInSection.append(talesFromTheFarSide)
    
    let deepThoughts = Book(title: "Deep Thoughts", author: "Jack Handey", numberOfPages: 98)
    fiction.booksInSection.append(deepThoughts)
    
    //default books in each history section:
    let wwII = Book(title: "A History of WWII", author: "James Johnson", numberOfPages: 888)
    history.booksInSection.append(wwII)
    
    let frenchRev = Book(title: "The French Revolution", author: "Judy Denmark", numberOfPages: 454)
    frenchRev.isCheckedOut = true
    history.booksInSection.append(frenchRev)
    
    let theGreatWall = Book(title: "The Great Wall of China", author: "Sally Smithers", numberOfPages: 712)
    history.booksInSection.append(theGreatWall)
    
    //default books in each music section
    let feldman = Book(title: "Morton Feldman", author: "Carl Julian", numberOfPages: 117)
    music.booksInSection.append(feldman)
    
    let baroque = Book(title: "Obscure Baroque Composers", author: "Vince Garamond", numberOfPages: 42)
    music.booksInSection.append(baroque)
    
    let rhapsody = Book(title: "Rhapsody: The Life of Franz Liszt", author: "Leslie Fields", numberOfPages: 233)
    music.booksInSection.append(rhapsody)
    
    let tinPan = Book(title: "The Songwriters of Tin Pan Alley", author: "Roger Jeffreys", numberOfPages: 102)
    tinPan.isCheckedOut = true
    music.booksInSection.append(tinPan)
    
    let composersOf19thI = Book(title: "19th Century Composers, Part I", author: "Jason Johns", numberOfPages: 244)
    music.booksInSection.append(composersOf19thI)
    
    let composersOf19thII = Book(title: "19th Century Composers, Part II", author: "Jason Johns", numberOfPages: 164)
    music.booksInSection.append(composersOf19thII)
    
    let composersOf19thIII = Book(title: "19th Century Composers, Part III", author: "Jason Johns", numberOfPages: 303)
    composersOf19thIII.isCheckedOut = true
    music.booksInSection.append(composersOf19thIII)
    
    let composersOf19thIV = Book(title: "19th Century Composers, Part IV", author: "Jason Johns", numberOfPages: 244)
    composersOf19thIV.isCheckedOut = true
    music.booksInSection.append(composersOf19thIV)
    
    let composersOf19thV = Book(title: "19th Century Composers, Part V", author: "Jason Johns", numberOfPages: 109)
    composersOf19thV.isCheckedOut = true
    music.booksInSection.append(composersOf19thV)
    
    let composersOf19thVI = Book(title: "19th Century Composers, Part VI", author: "Jason Johns", numberOfPages: 111)
    music.booksInSection.append(composersOf19thVI)
    
    let einstein = Book(title: "Einstein on the Beach: An Analysis", author: "Virgil Thomas", numberOfPages: 322)
    music.booksInSection.append(einstein)
    
    //default books in philosophy
    let genealogyOfMorals = Book(title: "On the Genealogy of Morals", author: "Friedrich Nietzsche", numberOfPages: 242)
    philosophy.booksInSection.append(genealogyOfMorals)
    
    let ancientGreeks = Book(title: "From Plato to Socrates", author: "Vicki Price", numberOfPages: 400)
    ancientGreeks.isCheckedOut = true
    philosophy.booksInSection.append(ancientGreeks)
    
    //default books in reference section
    let oxfordEng = Book(title: "Oxford English Dictionary", author: "Oxford University Press", numberOfPages: 1841)
    reference.booksInSection.append(oxfordEng)
    
    let rogets = Book(title: "Roget's Thesaurus", author: "Fred Roget", numberOfPages: 250)
    reference.booksInSection.append(rogets)
    
    //default books in science section
    let fabric = Book(title: "The Fabric of the Cosmos", author: "Brian Greene", numberOfPages: 200)
    science.booksInSection.append(fabric)
    
    let friction = Book(title: "Friction: A Final Frontier", author: "David Larsfeld", numberOfPages: 333)
    science.booksInSection.append(friction)
    
    let origin = Book(title: "On the Origin of Species", author: "Charles Darwin", numberOfPages: 338)
    origin.isCheckedOut = true
    science.booksInSection.append(origin)
    
    let heisenberg = Book(title: "The Heisenberg Uncertainty Prinicple", author: "Briana Xu", numberOfPages: 200)
    science.booksInSection.append(heisenberg)
    
    //default books in tech section
    let iOSVolI = Book(title: "iOS Programming, Volume I", author: "Terry Green", numberOfPages: 222)
    technology.booksInSection.append(iOSVolI)
    
    let iOSVolII = Book(title: "iOS Programming, Volume II", author: "Terry Green", numberOfPages: 245)
    technology.booksInSection.append(iOSVolII)
    
    let iOSVolIII = Book(title: "iOS Programming, Volume III", author: "Terry Green", numberOfPages: 192)
    technology.booksInSection.append(iOSVolIII)
    
    let iOSVolIV = Book(title: "iOS Programming, Volume IV", author: "Terry Green", numberOfPages: 222)
    technology.booksInSection.append(iOSVolIV)
    
    let iOSVolV = Book(title: "iOS Programming Volume V", author: "Terry Green", numberOfPages: 323)
    technology.booksInSection.append(iOSVolV)
    
    let hackers = Book(title: "Hacker's Delight", author: "Henry S. Warren, Jr.", numberOfPages: 495)
    hackers.isCheckedOut = true
    technology.booksInSection.append(hackers)
    selectedLibrary.listAllBooksInLibrary()
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
    return selectedLibrary.sections.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("sectionCell", forIndexPath: indexPath) as! UITableViewCell
    let sectionToDisplay = self.selectedLibrary.sections[indexPath.row]
    let sectionInRow = selectedLibrary.sections[indexPath.row]
    
    // Configure the cell...
    cell.textLabel!.text = sectionToDisplay.sectionName
    if sectionInRow.booksInSection.count == 1 {
      cell.detailTextLabel!.text = "1 book available"
    } else {
    cell.detailTextLabel!.text = "\(sectionInRow.booksInSection.count) books in section"
    }
    return cell
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let nav = segue.destinationViewController as! UINavigationController
    let booksInSectionTableViewController = nav.topViewController as! BooksInSectionTableViewController
    let indexPath = self.tableView.indexPathForSelectedRow()
    let selectedRow = indexPath!.row
    let selectedSection = selectedLibrary.sections[selectedRow]
    booksInSectionTableViewController.selectedSection = selectedSection
    let sameSelectedLibrary = selectedLibrary
    booksInSectionTableViewController.sameSelectedLibrary = sameSelectedLibrary
  }
}
