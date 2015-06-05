//
//  PsalmData.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/7/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import Foundation

// Global enum
enum nextQuote: Int {
  case Forward = 1
  case Backward = 2
  case Random = 3
  case Current = 4
  case Today = 5
} // end enum nextQuote

class PsalmData {
  
  // Singleton discussion: http://stackoverflow.com/questions/24024549/dispatch-once-singleton-model-in-swift?rq=1
  // create singleton object from https://www.codefellows.org/blog/singletons-and-swift
  class var sharedInstance: PsalmData {
    struct Static {
      static let instance: PsalmData = PsalmData()
    }
    return Static.instance
  }
  
  var globalVars: Globals!
  var quoteNumber: String = "1"
//  var psalmRef = ""
//  var psalmPlainRef = ""
//  var imageRef = ""
  var psalmImages = NSDictionary() //[Int: String]()
  var psalmQuotes = NSDictionary() // [Int: String]()
  var psalmQuotesPlain = NSDictionary() // [Int: String]()
  
  init() {
//    println("in init PsalmData")
   
    globalVars = Globals()
    
    // Reading plist files http://stackoverflow.com/questions/26391883/ios-8-swift-read-plist
    
    // Get quote data - formatted
    let pathq = NSBundle.mainBundle().pathForResource(globalVars.QUOTE_DATA_XML, ofType: "plist")
    psalmQuotes = NSDictionary(contentsOfFile: pathq!)!
    
    // Get quote data - plain text
    let pathqp = NSBundle.mainBundle().pathForResource(globalVars.QUOTE_DATA_PLAIN_XML, ofType: "plist")
    psalmQuotesPlain = NSDictionary(contentsOfFile: pathqp!)!
    
    // Get quote image
    let pathi = NSBundle.mainBundle().pathForResource(globalVars.IMAGE_DATA_XML, ofType: "plist")
    psalmImages = NSDictionary(contentsOfFile: pathi!)!
    
    DateCalculations()
    
    // each dict has [String, String] where the key is a number (in string form)
    // and the values are strings
    
    // imageDataXML - key is number, value is image name (without .jpg)
    // quoteDataXML - key is number, value is html formatted verse
    // quoteDataPlainXML - key is number, value is plain text verse
    
    // The keys in each dict are dict keys into each XML file which reference the
    // requested image and verse
    
    // Quote indexes should run from 1 to 365 or 366 to correspond to day of year
    // note: there may be a few extra quotes in the dict above 366 - they can be reached
    // by incrementing past 366
    
    var imin = 10000000
    var imax = -1
    
    // check html quotes
    println("== html quotes: \(psalmQuotes.count)")
    for i in 0..<psalmQuotes.count {
      imin = i < imin ? i : imin
      imax = i > imax ? i : imax
      if (psalmQuotes[toString(i)] == nil) {
        println("-- index \(i) not found")
        }
      }
    println("-- html quotes index range: \(imin) to \(imax)")
    
    imin = 10000000
    imax = -1
    // check text quotes
    println("== plain quotes: \(psalmQuotesPlain.count)")
    for i in 0..<psalmQuotes.count {
      imin = i < imin ? i : imin
      imax = i > imax ? i : imax
      if (psalmQuotes[toString(i)] == nil) {
        println("-- index \(i) not found")
      }
    }
    println("-- plain quotes index range: \(imin) to \(imax)")
    
    imin = 10000000
    imax = -1
    // check images
    println("== images: \(psalmImages.count)")
    for i in 0..<psalmQuotes.count {
      imin = i < imin ? i : imin
      imax = i > imax ? i : imax
      if (psalmQuotes[toString(i)] == nil) {
        println("-- index \(i) not found")
      }
    }
    println("-- images index range: \(imin) to \(imax)")
  }
  
  
  func psalmQuotesDict() -> NSDictionary {
    return psalmQuotesPlain
  }
  
  // Date Handling 1 http://www.globalnerdy.com/2015/01/26/how-to-work-with-dates-and-times-in-swift-part-one/
  
  // Date Handling 2: Date Calculations http://www.globalnerdy.com/2015/01/29/how-to-work-with-dates-and-times-in-swift-part-two-calculations-with-dates/
  
  func DateCalculations() {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy/MM/DD hh:mm"
    
    let refDate = formatter.dateFromString("2000/01/01 00:01")
    let userCalendar = NSCalendar.currentCalendar()
    let dayUnit: NSCalendarUnit = .CalendarUnitDay
    let dayDifference = userCalendar.components(dayUnit,
      fromDate:refDate!,
      toDate: NSDate(),
      options: nil)
    
    // ordinality of unit example
    // http://stackoverflow.com/questions/1904832/does-nscalendar-ordinalityofunitinunitfordate-not-work
    
    // number of days since beginning of year
    let dayOfYear = userCalendar.ordinalityOfUnit(.CalendarUnitDay, inUnit: .CalendarUnitYear, forDate: NSDate())
    println("== day of year: \(dayOfYear)")
      // use dayOfYear as index from date
    quoteNumber = toString(dayOfYear)
//    quoteNumber = toString(dayDifference.day % (psalmImages.count))
  } // end DateCalculations

  func getNextQuoteIndex(direction: nextQuote) {
    var index =  quoteNumber.toInt() // convert to int for calculations
    // adjust quoteNumber acccording to direction
    switch direction {
    case .Forward:
      // increment index and make sure it doesn't 
      // exceed length of array, if so set back to beginning, 0
      index = ++index! >= psalmImages.count ? 1 : index
      println("--Forward ind: \(index)")
    case .Backward:
      // decrement index - no 0 key
      index = --index! <= 0 ? psalmImages.count - 1 : index
      println("--Backward ind: \(index)")
    case .Random:
      // get random index
        // arc4random_uniform(n) goes from 0 to n-1
        // Used notes from http://stackoverflow.com/questions/24007129/how-does-one-generate-a-random-number-in-apples-swift-language 
        // Don't want 0 index on bottom end so  add 1 to random
        // Don't want to go over top end so sub 2 from count
      index = Int(arc4random_uniform(UInt32(psalmImages.count - 2)) + 1 )
      println("--Random ind: \(index)")
    case .Current:
      // Don't do anything
      println("--Current ind: \(index)")
    case .Today:
      // Get today quote
      DateCalculations()
      println("--Today quoteNumber: \(quoteNumber)")
      return // quoteNumber already set
    default:
      println("--Default")
    }
    quoteNumber = toString(index!) // convert back to string
  } // end getNextQuoteIndex(Int)
  
  
  // set the current quote number based on a search
  func SetQuoteNumber(index: String) {
    quoteNumber = index 
  }
  
  func PsalmImage() -> String {
    return psalmImages.valueForKey(quoteNumber) as! String 
  } // end PsalmImage
  
  func PsalmQuote() -> String {
    return psalmQuotes.valueForKey(quoteNumber) as! String
  } // end PsalmQuote
  
  func PsalmQuotePlain() -> String {
    return psalmQuotesPlain.valueForKey(quoteNumber) as! String
  } // end PsalmQuotePlain
  
  
  
  
} // end class
