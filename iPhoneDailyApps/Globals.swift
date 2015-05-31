//
//  Globals.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/7/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import Foundation

class Globals {

  // Singleton discussion: http://stackoverflow.com/questions/24024549/dispatch-once-singleton-model-in-swift?rq=1
  // create singleton object from https://www.codefellows.org/blog/singletons-and-swift
  class var sharedInstance: PsalmData {
    struct Static {
      static let instance: PsalmData = PsalmData()
    }
    return Static.instance
  }
  
let info_Table = ["Facebook",  "Twitter",  "Email",  "Rate this app",  "Other Products"]

  // Selections for each product
// "PRODUCT_KJV"
// "PRODUCT_NIV"
// "PRODUCT_NASB"
// "PRODUCT_ESV"
// "PRODUCT_ASV"
// "PRODUCT_Spurgeon"
// "PRODUCT_ESVNAV"
// "PRODUCT_WillRogers"
  
  // Product Names from info.plist
  // PsalmQuotesKJV
  // PsalmQuotesNIV
  // PsalmQuotesNASB
  // PsalmQuotesESV
  
  
  
  var IMAGE_DATA_XML: String = "1"
  var QUOTE_DATA_XML: String = "2"
  var QUOTE_DATA_PLAIN_XML: String = "3"
  var SPLASH_SCREEN: String = "4"
  var SPLASH_SCREEN_IMAGE: String = "4.5"
  var HELP_SCREEN: String = "5"
  var TIPS_SCREEN: String = "6"
  var COPYRIGHT_SCREEN: String = "7"
  var PRODUCTS_SCREEN: String = "8"
  var SHARE_SCREEN: String = "9"
  var DEV_EMAIL_SUB: String = "10"
  var RATE_PRODUCT_URL: String = "11"
  var FB_Message: String = "12"
  var FB_Table: String = "13"
  var email_Table: String = "14"
  var tweet_Table: String = "15"
  // var info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products",
  // These go into SHKConfig.h App Description
  var FMBMyAppName: String = "16"
  var FMBMyAppNameShort: String = "17"
  var FMBMyAppURL: String = "18"
  // SHKConfig.h Facebook Section
  var FBAppID: String = "19"
  var FMBFacebookKey: String = "20"
  var FMBFacebookSecret: String = "21"
  // SHKConfig.h Twitter Section
  var FMBTwitterConsumerKey: String = "22"
  var FMBTwitterSecret: String = "23"
  // You need to set this if using OAuth, see note above (xAuth users can skip it)
  var FMBTwitterCallbackUrl: String = "24"
  var kBaseURL: String = "25"
  // Flurry
  var kFlurryKey: String = "26"
  
  // load unique variables for each product
  init () {

    //  Getting info from plist http://stackoverflow.com/questions/1247142/getting-an-iphone-apps-product-name-at-runtime
//    let appInfo: AnyObject? = NSBundle.valueForKey("Bundle display name")   // objectForInfoDictionaryKey("Bundle display name")
//    let appInfo = NSBundle.mainBundle().bundleIdentifier //  = com.systemsofmerritt.PsalmQuotesKJV
//    let infoDict = NSBundle.mainBundle().infoDictionary!.description
//    let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
//    let infoDict1 = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
    
    // by using the CFBundleName the type of App can be determined at run time
    // so I don't have to make changes for each product compile
    let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
    
//    println("----bundle display name: \(appInfo!); ; name: \(appName); name: \(infoDict1) description: \(infoDict)")
    
    switch appName {
//    switch sel {
      
    case "PsalmQuotesKJV":
//    case "PRODUCT_KJV":
      self.IMAGE_DATA_XML = "ImageDataXML-KJV"
      self.QUOTE_DATA_XML = "QuoteDataXML-KJV"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-KJV"
      self.SPLASH_SCREEN = "splashscreen-kjv"
      self.SPLASH_SCREEN_IMAGE = "KJVsplash@2x.png"
      self.HELP_SCREEN = "help-kjv"
      self.TIPS_SCREEN = "tips-kjv"
      self.COPYRIGHT_SCREEN = "copyright-kjv"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-kjv"
      self.DEV_EMAIL_SUB = "Psalm Daily Quotes KJV Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/psalm-daily-quotes/id338051945?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Sharing the beauty of the Psalms with you!"
      self.FB_Table = "Share Current Image & Psalm"
      self.email_Table = "Email the Blessing!"
      self.tweet_Table = "Tweet the Blessing!"
      // self.info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products",
      // These go into SHKConfig.h App Description
      self.FMBMyAppName			= "Psalm Daily Quotes KJV"
      self.FMBMyAppNameShort		= "-KJV"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/psalm-daily-quotes/id338051945?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "118258491562424"
      self.FMBFacebookKey				= "0c7fe0c7043cae98d13c3be54e803843"
      self.FMBFacebookSecret			= "59b2f64653ca448da54dd9fe841bc99c"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= "eKJZw78xnB5HnEUOkYvVnA"
      self.FMBTwitterSecret			= "nCe6C0Io0pHk6SI0uWg3Tsz5tj8fi2G62jvrzoUDos"
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/psalms/"
      // Flurry
      self.kFlurryKey = "PVWCCXBDQ8Q3774GG4J7"
//      println("init KJV IMAGE_DATA_XML: \(IMAGE_DATA_XML)")

//    case "PRODUCT_NIV":
    case "PsalmQuotesNIV":
      self.IMAGE_DATA_XML = "ImageDataXML-NIV"
      self.QUOTE_DATA_XML = "QuoteDataXML-NIV"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-NIV"
      self.SPLASH_SCREEN = "splashscreen-niv"
      self.SPLASH_SCREEN_IMAGE = "NIVsplash@2x.png"
      self.HELP_SCREEN = "help-niv"
      self.TIPS_SCREEN = "tips-niv"
      self.COPYRIGHT_SCREEN = "copyright-niv"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-niv"
      self.DEV_EMAIL_SUB = "Psalm Daily Quotes NIV Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/psalm-daily-quotes-niv/id358393583?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Sharing the beauty of the Psalms with you!"
      self.FB_Table = "Share Current Image & Psalm"
      self.email_Table = "Email the Blessing!"
      self.tweet_Table = "Tweet the Blessing!"
      // self.info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products",
      // These go into SHKConfig.h App Description
      self.FMBMyAppNameShort		= "-NIV"
      self.FMBMyAppName			= "Psalm Daily Quotes NIV"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/psalm-daily-quotes-niv/id358393583?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "131919236872920"
      self.FMBFacebookKey				= "5677464c9c0d61c7d6686dd8115b36df"
      self.FMBFacebookSecret			= "f4847fc2888f6cfe81d34b21bcbe985a"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= "P1ZjPVVwmLwX1SePUQLeA"
      self.FMBTwitterSecret			= "Z3MyeJdEqyJ2yGOgz752o0eDWJo8omdCR0D1N8v0WU"
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/psalms/"
      // Flurry
      self.kFlurryKey = "xxxxxxxxxxxxxxxxxx"
      
//    case "PRODUCT_NASB":
    case "PsalmQuotesNASB":
      self.IMAGE_DATA_XML = "ImageDataXML-NASB"
      self.QUOTE_DATA_XML = "QuoteDataXML-NASB"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-NASB"
      self.SPLASH_SCREEN = "splashscreen-nasb"
      self.SPLASH_SCREEN_IMAGE = "NASBsplash@2x.png"
      self.HELP_SCREEN = "help-nasb"
      self.TIPS_SCREEN = "tips-nasb"
      self.COPYRIGHT_SCREEN = "copyright-nasb"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-nasb"
      self.DEV_EMAIL_SUB = "Psalm Daily Quotes NASB Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/psalm-daily-quotes-nasb/id347297090?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Sharing the beauty of the Psalms with you!"
      self.FB_Table = "Share Current Image & Psalm"
      self.email_Table = "Email the Blessing!"
      self.tweet_Table = "Tweet the Blessing!"
      // self.info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products",
      // These go into SHKConfig.h App Description
      self.FMBMyAppNameShort		= "-NASB"
      self.FMBMyAppName			= "Psalm Daily Quotes NASB"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/psalm-daily-quotes-nasb/id347297090?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "188586487872543"
      self.FMBFacebookKey				= "188586487872543"
      self.FMBFacebookSecret			= "aaefe55dc8afa053ee88e6010b1c5096"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= ""
      self.FMBTwitterSecret			= ""
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/psalms/"
      // Flurry
      self.kFlurryKey = "xxxxxxxxxxxxxxxxxx"
      
//    case "PRODUCT_ESV":
    case "PsalmQuotesESV":
      self.IMAGE_DATA_XML = "ImageDataXML-ESV"
      self.QUOTE_DATA_XML = "QuoteDataXML-ESV"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-ESV"
      self.SPLASH_SCREEN = "splashscreen-esv"
      self.SPLASH_SCREEN_IMAGE = "ESVsplash@2x.png"
      self.HELP_SCREEN = "help-esv"
      self.TIPS_SCREEN = "tips-esv"
      self.COPYRIGHT_SCREEN = "copyright-esv"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-esv"
      self.DEV_EMAIL_SUB = "Psalm Daily Quotes ESV Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/psalm-daily-quotes-esv/id354090091?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Sharing the beauty of the Psalms with you!"
      self.FB_Table = "Share Current Image & Psalm"
      self.email_Table = "Email the Blessing!"
      self.tweet_Table = "Tweet the Blessing!"
      // self.info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products",
      // These go into SHKConfig.h App Description
      self.FMBMyAppNameShort		= "-ESV"
      self.FMBMyAppName			= "Psalm Daily Quotes ESV"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/psalm-daily-quotes-esv/id354090091?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "185178481553001"
      self.FMBFacebookKey				= "185178481553001"
      self.FMBFacebookSecret			= "ed7a10c61f098efa0276de2278700bd9"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= ""
      self.FMBTwitterSecret			= ""
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/psalms/"
      // Flurry
      self.kFlurryKey = "xxxxxxxxxxxxxxxxxx"
      
//    case "PRODUCT_ASV":
    case "PsalmQuotesASV":
      self.IMAGE_DATA_XML = "ImageDataXML-ASV"
      self.QUOTE_DATA_XML = "QuoteDataXML-ASV"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-ASV"
      self.SPLASH_SCREEN = "splashscreen-asv"
      self.SPLASH_SCREEN_IMAGE = "ASVsplash@2x.png"
      self.HELP_SCREEN = "help-asv"
      self.TIPS_SCREEN = "tips-asv"
      self.COPYRIGHT_SCREEN = "copyright-asv"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-asv"
      self.DEV_EMAIL_SUB = "Psalm Daily Quotes ASV Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/psalm-daily-quotes-asv/id352307059?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Sharing the beauty of the Psalms with you!"
      self.FB_Table = "Share Current Image & Psalm"
      self.email_Table = "Email the Blessing!"
      self.tweet_Table = "Tweet the Blessing!"
      // self.info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products",
      // These go into SHKConfig.h App Description
      self.FMBMyAppNameShort		= "-ASV"
      self.FMBMyAppName			= "Psalm Daily Quotes ASV"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/psalm-daily-quotes-asv/id352307059?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "115412111892756"
      self.FMBFacebookKey				= "115412111892756"
      self.FMBFacebookSecret			= "5540dee3d432d7a811d5a1a2253ceb9c"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= ""
      self.FMBTwitterSecret			= ""
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/psalms/"
      // Flurry
      self.kFlurryKey = "xxxxxxxxxxxxxxxxxx"
      
//    case "PRODUCT_Spurgeon":
    case "PRODUCT_Spurgeon":
      self.IMAGE_DATA_XML = "ImageDataXML-SDQ"
      self.QUOTE_DATA_XML = "QuoteDataXML-SDQ"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-SDQ"
      self.SPLASH_SCREEN = "splashscreen-sdq"
      self.SPLASH_SCREEN_IMAGE = "Spurgeonsplash@2x.png"
      self.HELP_SCREEN = "help-sdq"
      self.TIPS_SCREEN = "tips-sdq"
      self.COPYRIGHT_SCREEN = "copyright-sdq"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-sdq"
      self.DEV_EMAIL_SUB = "Spurgeon Daily Quotes Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/spurgeon-daily-quotes/id307832747?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Sharing the wisdom of Spurgeon with you!"
      self.FB_Table = "Share Current Image & Quote"
      self.email_Table = "Email the Blessing!"
      self.tweet_Table = "Tweet the Blessing!"
      // self.info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products",
      // These go into SHKConfig.h App Description
      self.FMBMyAppNameShort		= "-SDQ"
      self.FMBMyAppName			= "Spurgeon Daily Quotes"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/spurgeon-daily-quotes/id307832747?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "271682589525703"
      self.FMBFacebookKey				= "271682589525703"
      self.FMBFacebookSecret			= "820e22fbfbb95d87d7b7cc2754048afb"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= ""
      self.FMBTwitterSecret			= ""
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/spurgeon/"
      // Flurry
      self.kFlurryKey = "xxxxxxxxxxxxxxxxxx"
      
//    case "PRODUCT_ESVNAV":
    case "PRODUCT_ESVNAV":
      self.IMAGE_DATA_XML = "ImageDataXML-ESVNAV"
      self.QUOTE_DATA_XML = "QuoteDataXML-ESVNAV"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-ESVNAV"
      self.SPLASH_SCREEN = "splashscreen-esvnav"
      self.SPLASH_SCREEN_IMAGE = "ESVNAVsplash@2x.png"
      self.HELP_SCREEN = "help-esvnav"
      self.TIPS_SCREEN = "tips-esvnav"
      self.COPYRIGHT_SCREEN = "copyright-esvnav"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-esvnav"
      self.DEV_EMAIL_SUB = "Psalm Daily Quotes Navy ESV Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/navy-psalm-daily-quotes-esv/id498970549?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Honoring our military and sharing the beauty of the Psalms with you!"
      self.FB_Table = "Share Current Image & Psalm"
      self.email_Table = "Email the Blessing!"
      self.tweet_Table = "Tweet the Blessing!"
      // self.info_Table = "Facebook", = "Twitter", = "Email", = "Rate this app", = "Other Products",
      // These go into SHKConfig.h App Description
      self.FMBMyAppNameShort		= "-ESVNAV"
      self.FMBMyAppName			= "Psalm Daily Quotes ESV"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/navy-psalm-daily-quotes-esv/id498970549?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "216568981732944"
      self.FMBFacebookKey				= "216568981732944"
      self.FMBFacebookSecret			= "9b00979c51a12f5177382c30d5da4376"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= ""
      self.FMBTwitterSecret			= ""
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/navy/"
      // Flurry
      self.kFlurryKey = "33ZCAN54CAZC8LQPMH4V"
      
//    case "PRODUCT_WillRogers":
    case "PRODUCT_WillRogers":
      self.IMAGE_DATA_XML = "ImageDataXML-WRDQ"
      self.QUOTE_DATA_XML = "QuoteDataXML-WRDQ"
      self.QUOTE_DATA_PLAIN_XML = "QuoteDataPlainXML-WRDQ"
      self.SPLASH_SCREEN = "splashscreen-wrdq"
      self.SPLASH_SCREEN_IMAGE = "WRDQsplash@2x.png"
      self.HELP_SCREEN = "help-wrdq"
      self.TIPS_SCREEN = "tips-wrdq"
      self.COPYRIGHT_SCREEN = "copyright-wrdq"
      self.PRODUCTS_SCREEN = "SOMproducts"
      self.SHARE_SCREEN = "share-email-wrdq"
      self.DEV_EMAIL_SUB = "Will Rogers Daily Quotes Message"
      self.RATE_PRODUCT_URL = "https://itunes.apple.com/us/app/will-rogers-daily-quotes/id381332965?mt=8&uo=6&at=10laLs&ct=iosProducts"
      self.FB_Message  = "Sharing the humor of Will Rogers with you!"
      self.FB_Table = "Share Current Image & Quote"
      self.email_Table = "Email the Quote!"
      self.tweet_Table = "Tweet the Quote!"
      // self.info_Table = "Facebook", = "Email", = "Rate this app", = "Other Products", = "Will Rogers",
      // These go into SHKConfig.h App Description
      self.FMBMyAppNameShort		= "-WRDQ"
      self.FMBMyAppName			= "Will Rogers Daily Quotes"
      self.FMBMyAppURL				= "https://itunes.apple.com/us/app/will-rogers-daily-quotes/id381332965?mt=8&uo=6&at=10laLs&ct=iosProducts"
      // SHKConfig.h Facebook Section
      self.FBAppID                     = "118192658280908"
      self.FMBFacebookKey				= "118192658280908"
      self.FMBFacebookSecret			= "9030be5e392891e07b7eaf07758613af"
      // SHKConfig.h Twitter Section
      self.FMBTwitterConsumerKey		= ""
      self.FMBTwitterSecret			= ""
      // You need to set this if using OAuth, see note above (xAuth users can skip it)
      self.FMBTwitterCallbackUrl		= "http://bit.ly/SOMip-SOM"
      self.kBaseURL = "http://www.systemsofmerritt.com/images/willrogers/"
      // Flurry
      self.kFlurryKey = "xxxxxxxxxxxxxxxxxx"

    default:
      let d = "default"
      println("default d: \(d)")
      
    } // end switch sel
    
    /* Product URLs
    // = ""         // Will Rogers Daily Quote
    // = ""			// Spurgeon Daily Quotes
    // = ""		// Psalm Daily Quotes ASV
    // = ""		// Psalm Daily Quotes NKJV
    // = ""		// Psalm Daily Quotes NASB
    // = ""		// Psalm Daily Quotes NIV
    // = ""		// Psalm Daily Quotes KJV
    // = ""       // Psalm Daily Quotes ESV
    // = ""       // Psalm Navy Daily Quotes ESV
    // = ""          // Systems of Merritt
    */
    
  } // init(sel: String)
  
} // end class

