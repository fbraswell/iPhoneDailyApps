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
    println("in init PsalmData")
    
// //    let appInfo: AnyObject? = NSBundle.valueForKey("Bundle display name")   // objectForInfoDictionaryKey("Bundle display name")
//    let appInfo = NSBundle.mainBundle().bundleIdentifier
//    let infoDict = NSBundle.mainBundle().infoDictionary!.description
//    let infoDict1 = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
//    
//    let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
//
//    println("----bundle display name: \(appInfo!); ; name: \(appName); name: \(infoDict1) description: \(infoDict)")
//    
    globalVars = Globals()
    
    // Reading plist files http://stackoverflow.com/questions/26391883/ios-8-swift-read-plist
    let pathq = NSBundle.mainBundle().pathForResource(globalVars.QUOTE_DATA_XML, ofType: "plist")
    psalmQuotes = NSDictionary(contentsOfFile: pathq!)!
    
    let pathqp = NSBundle.mainBundle().pathForResource(globalVars.QUOTE_DATA_PLAIN_XML, ofType: "plist")
    psalmQuotesPlain = NSDictionary(contentsOfFile: pathqp!)!
    
    let pathi = NSBundle.mainBundle().pathForResource(globalVars.IMAGE_DATA_XML, ofType: "plist")
    psalmImages = NSDictionary(contentsOfFile: pathi!)!
    
    DateCalculations()
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
    
    quoteNumber = toString(dayDifference.day % (psalmImages.count))
  } // end DateCalculations

  func getNextQuoteIndex(direction: nextQuote) {
    var index =  quoteNumber.toInt() // convert to int for calculations
//    var index = quoteNumber as? Int
    // adjust quoteNumber acccording to direction
    switch direction {
    case .Forward:
      // increment index
      
      // increment index and make sure it doesn't 
      // exceed length of array, if so set back to beginning, 0
      index = ++index! > psalmImages.count ? 0 : index
      
      println("--Forward")
    case .Backward:
      // decrement index
      index = --index! < 0 ? psalmImages.count : index
      println("--Backward")
    case .Random:
      // get random index
      index = Int(arc4random()) % (psalmImages.count)
      println("--Random")
    case .Current:
      // Don't do anything
      println("--Current")
    default:
      println("--Default")
    }
    quoteNumber = toString(index!) // convert back to string
  } // end getNextQuoteIndex(Int)
  
  
  func PsalmImage() -> String {
//    globalVars = Globals(sel: "PRODUCT_KJV")
//    var my_info_table = globalVars!.info_Table[1]
//    var my_IMAGE_DATA_XML = globalVars.IMAGE_DATA_XML
//    var my_QUOTE_DATA_XML = globalVars.QUOTE_DATA_XML
//    println("image_data_xml in PsalmData: \(my_IMAGE_DATA_XML) and quote_data_xml: \(my_QUOTE_DATA_XML)")
    
//    let path = NSBundle.mainBundle().pathForResource("ImageDataXML-KJV", ofType: "plist")
//    let dict = NSDictionary(contentsOfFile: path!)
//    let imageName = dict!.valueForKey(quoteNumber) as! String
//    return imageName + ".jpg"
    
    return psalmImages.valueForKey(quoteNumber) as! String 
  } // end PsalmImage
  
  func PsalmQuote() -> String {    
//    let path = NSBundle.mainBundle().pathForResource("QuoteDataXML-KJV", ofType: "plist")
//    let dict = NSDictionary(contentsOfFile: path!)
//    let quote = dict!.valueForKey(quoteNumber) as! String
//    return quote
    
    return psalmQuotes.valueForKey(quoteNumber) as! String
  } // end PsalmQuote
  
  func PsalmQuotePlain() -> String {
    return psalmQuotesPlain.valueForKey(quoteNumber) as! String
  } // end PsalmQuotePlain
  
  
  
  
} // end class
