//
//  SearchTableViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/14/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
  
  @IBOutlet weak var tableCell: UITableViewCell!
  @IBOutlet weak var searchBar: UISearchBar!
  
  var psalmInfo: PsalmData!

    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "Search Verses"
      searchBar.becomeFirstResponder()
      
      // psalmQuotesDict - dictionary of quotes and quote indexes
      psalmInfo = PsalmData.sharedInstance;
      var psalmQuotesDict = psalmInfo!.psalmQuotesDict()
      // create array of quotes only
      arrayData = psalmQuotesDict.allValues as! [String]
      
//      println(arrayData)
//      println(filteredData)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
  
  //  var arrayData = ["string1", "string2", "string red", "string green", "string blue"]
  var arrayData: [String] = []
  var filteredData:[String] = []
  
  // compare strings as lower case
  func filterContentForSearchText(searchText: String) {
    let searchTextlc = searchText.lowercaseString
    self.filteredData = self.arrayData.filter({(mystring: String) -> Bool in
      let mystringlc = mystring.lowercaseString
      let stringMatch = mystringlc.rangeOfString(searchTextlc)
      return stringMatch != nil
      
//      let categoryMatch = (scope == "ALL") || (mystring.category == scope)
//      let stringMatch = mystring.name.rangeOfString(searchText)
//      return categoryMatch && (stringMatch != nil)
    })
  }
  
  func updateSearchResultsForSearchController(searchController: UISearchController) {
    
    // No need to update anything if we're being dismissed.
    if !searchController.active {
      return
    }
    
    // do the filtering here
    println("- in updateSearchResultsForSearchController")
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Search Bar Delegate
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) { // called when keyboard search button pressed
    println("- in searchBarSearchButtonClicked")
    filterContentForSearchText(searchBar.text)
//    println(filteredData)
      self.tableView.reloadData()
  }
  
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) { // called when text changes (including clear)
    println("- in searchBar textDidChange")
    filterContentForSearchText(searchBar.text)
    //    println(filteredData)
    self.tableView.reloadData()
  }
  

  func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool { // return true to become first responder
    
    return true
  }
  
/*
  protocol UISearchBarDelegate : UIBarPositioningDelegate, NSObjectProtocol {
    
    optional func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool // return NO to not become first responder
    optional func searchBarTextDidBeginEditing(searchBar: UISearchBar) // called when text starts editing
    optional func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool // return NO to not resign first responder
    optional func searchBarTextDidEndEditing(searchBar: UISearchBar) // called when text ends editing
    optional func searchBar(searchBar: UISearchBar, textDidChange searchText: String) // called when text changes (including clear)
    @availability(iOS, introduced=3.0)
    optional func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool // called before text changes
    
    optional func searchBarSearchButtonClicked(searchBar: UISearchBar) // called when keyboard search button pressed
    optional func searchBarBookmarkButtonClicked(searchBar: UISearchBar) // called when bookmark button pressed
    optional func searchBarCancelButtonClicked(searchBar: UISearchBar) // called when cancel button pressed
    @availability(iOS, introduced=3.2)
    optional func searchBarResultsListButtonClicked(searchBar: UISearchBar) // called when search results button pressed
    
    @availability(iOS, introduced=3.0)
    optional func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int)
*/
  
  // Called after the user changes the selection.
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    println("=selected index: \(indexPath) and row: \(indexPath.row)")
    
//    println("selected row filtered data: \(filteredData[indexPath.row])")
    // Do a reverse lookup in the plist to find the index for the quote and image
    let searchForQuote = filteredData[indexPath.row]
    
    var psalmQuotesDict = psalmInfo!.psalmQuotesDict()
    
    for (key, val) in psalmQuotesDict {
//      let val_lc = val as! String
      if searchForQuote == val as! String {
        println("found key \(key)")
        // set the index in data hanlder so main view will go to that verse and image
        psalmInfo.SetQuoteNumber(key as! String)
        break // end loop
      }
    }
  
    self.performSegueWithIdentifier("goToMainView", sender: indexPath)
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
        return self.filteredData.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
      cell.textLabel!.text = filteredData[indexPath.row]
      cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }

}
