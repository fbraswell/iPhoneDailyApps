//
//  HelpTableTableViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/9/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit
import MessageUI
import Social

 var psalmInfo: PsalmData!

class HelpViewController: UITableViewController,
              MFMailComposeViewControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Help & Info"
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //    println("segue time")
    
    switch segue.identifier! {
      case "EmailShare":
        println("--email Share")
        Flurry.logEvent("email Share") // FLURRY EVENT
        shareEmail("Share by email")
      case "EmailFrank":
        println("--email Frank")
        Flurry.logEvent("email Frank") // FLURRY EVENT
        sendEmailFrank("email Frank")
      case "RateApp":
        println("--rate app")
        Flurry.logEvent("rate App") // FLURRY EVENT
        rateApp()
      case "postToFacebook":
        println("--Facebook post")
        Flurry.logEvent("Facebook post") // FLURRY EVENT
        postToFacebook()
      case "ToSearch":
        println("-to search")
        Flurry.logEvent("to Search") // FLURRY EVENT
      case "ToProducts":
        println("-to products")
        Flurry.logEvent("to Products") // FLURRY EVENT
      case "ToTips":
        println("-to tips")
        Flurry.logEvent("to Tips") // FLURRY EVENT
      case "ToHelp":
        println("-to help")
        Flurry.logEvent("to Help") // FLURRY EVENT
      case "ToSplash":
        println("-to splash")
        Flurry.logEvent("to Splash") // FLURRY EVENT
      case "ToCredits":
        println("-to credits")
        Flurry.logEvent("to Credits") // FLURRY EVENT
      case "BackToQuotes":
        println("-back to quotes")
        Flurry.logEvent("back to Quotes") // FLURRY EVENT
      case "todaysquote":
        println("-todays quote")
        // psalmInfo = PsalmData() // needed to use sharedInstance!
        psalmInfo = PsalmData.sharedInstance
        psalmInfo.getNextQuoteIndex(.Today)
        Flurry.logEvent("todays Quote") // FLURRY EVENT
    default:
      println("no case for segue found")
    } // end switch
    
  } // end override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  
  // Post to Facebook http://www.ioscreator.com/tutorials/facebook-tutorial-ios8-swift
  // http://sagarrkothari.com/sharing-via-facebook-in-ios-in-swift-using-slcomposeviewcontroller/
  // http://stackoverflow.com/questions/24597166/how-can-i-attach-a-video-file-to-publish-on-facebook-with-ios8-social-framework
  
  func postToFacebook() {
    
    if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
      let fbController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
      //    var okTwitter = SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)
      
      let globalVars = Globals()
      
      let psalmData = PsalmData()
      let imageRef = psalmData.PsalmImage() + ".jpg"
      let psalmRef = psalmData.PsalmQuote()
      let psalmPlainRef = psalmData.PsalmQuotePlain()
      
      let imageRefUIImage = UIImage(named: imageRef)
      fbController.addImage(imageRefUIImage)
      fbController.setInitialText(psalmPlainRef)
      let url = NSURL(string: "http://www.systemsofmerritt.com")
      fbController.addURL(url)
      self.presentViewController(fbController, animated: true, completion: nil)
      
        fbController.completionHandler = {
          result -> Void in
          
          var getResult = result as SLComposeViewControllerResult;
          switch(getResult.rawValue) {
          case SLComposeViewControllerResult.Cancelled.rawValue:
            println("Cancelled")
          case SLComposeViewControllerResult.Done.rawValue:
            println("It Works!")
            Flurry.logEvent("Facebook post success") // FLURRY EVENT
          default: println("Error!")
          }
          self.dismissViewControllerAnimated(true, completion: nil)
      }
      
    } else {
      println("no Facebook account found on device.")
    }
  } // end func postToFacebook()
  
  // UIAlert View info: http://stackoverflow.com/questions/24022479/how-would-i-create-a-uialertview-in-swift
  // Note: UIAlertView is deprecated. Use UIAlertController with a preferredStyle of UIAlertControllerStyleAlert instead

  func rateApp () {
    var alert = UIAlertController(title: "Help Spread the Word", message: "If you like this app, please rate it in the App Store. Thanks!", preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "Maybe Later", style: UIAlertActionStyle.Default, handler: nil))
    
    alert.addAction(UIAlertAction(title: "Rate it Now", style: .Default, handler: { action in
    switch action.style{
    case .Default:
    println("default")
    let globalVars = Globals()
    println(globalVars.RATE_PRODUCT_URL)
    
      let url = NSURL(string: globalVars.RATE_PRODUCT_URL)
      UIApplication.sharedApplication().openURL(url!)
      /*	// Check in the ProductMacros.h for RATE_PRODUCT_URL defs
      // They should match these
      
      // @"http://bit.ly/SOMa-WRDQ"       // Will Rogers Daily Quotes
      // @"http://bit.ly/SOMa-SDQ"		// Spurgeon Daily Quotes
      // @"http://bit.ly/SOMa-PDQASV"		// Psalm Daily Quotes ASV
      // @""                              // Psalm Daily Quotes NKJV
      // @"http://bit.ly/SOMa-PDQNASB"	// Psalm Daily Quotes NASB
      // @"http://bit.ly/SOMa-PDQNIV"		// Psalm Daily Quotes NIV
      // @"http://bit.ly/SOMa-PDQKJV"		// Psalm Daily Quotes KJV
      // @"http://bit.ly/SOMa-PDQESV"     // Psalm Daily Quotes ESV
      */
      
    case .Cancel:
    println("cancel")
    
    case .Destructive:
    println("destructive")
    }
    }))
    
    self.presentViewController(alert, animated: true, completion: nil)
  } // end rateApp()
  
//  @IBAction func shareEmail(sender: AnyObject) {
  func shareEmail(sender: AnyObject) {
    println("share email")
    
    let globalVars = Globals()
    
    let psalmData = PsalmData()
    let imageRef = psalmData.PsalmImage() 
    let psalmRef = psalmData.PsalmQuote()
    let psalmPlainRef = PsalmData.PsalmQuotePlain
    
    // Loading a webView: http://stackoverflow.com/questions/26647447/load-local-html-into-uiwebview-using-swift
        let fileName = globalVars.SHARE_SCREEN
          let filePath = NSBundle.mainBundle().pathForResource(globalVars.SHARE_SCREEN, ofType: "html")
//          let url = NSURL.fileURLWithPath(filePath!)
//          let request = NSURLRequest(URL: url!)
//          webView.loadRequest(request)
    
    // using MessageUI: http://www.andrewcbancroft.com/2014/08/25/send-email-in-app-using-mfmailcomposeviewcontroller-with-swift/
  
    //    let mailComposeViewController = configuredMailComposeViewController()
    
    let mailComposerVC = MFMailComposeViewController()
    mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
//    mailComposerVC.setToRecipients(["iphone@systemsofmerritt.com"])
    mailComposerVC.setSubject(globalVars.email_Table)
    
//    mailComposerVC.setMessageBody("Share with others,<br><br><br><br><br>", isHTML: true)
//    let content = filePath.initWithContentsOfFile(usedEncodeing: nil, error: nil)
    if let content = String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: nil) {
      let emailBody = String(format: content, imageRef, psalmRef)
//    if let fileData = NSString(contentsOfFile: filePath!) {
      mailComposerVC.setMessageBody(emailBody, isHTML: true)
    }
    
    if MFMailComposeViewController.canSendMail() {
      //    if mailComposerVC.canSendMail() {
      self.presentViewController(mailComposerVC, animated: true, completion: nil)
    } else {
      self.showSendMailErrorAlert()
    }

  }

//  @IBAction func sendEmailFrank(sender: AnyObject) {
  func sendEmailFrank(sender: AnyObject) {
    println("send email to Frank")
    let globalVars = Globals()
    
    // Loading a webView: http://stackoverflow.com/questions/26647447/load-local-html-into-uiwebview-using-swift
//    let fileName = globalVars.SHARE_SCREEN
    //      let filePath = NSBundle.mainBundle().pathForResource(globalVars.SHARE_SCREEN, ofType: "html")
    //      let url = NSURL.fileURLWithPath(filePath!)
    //      let request = NSURLRequest(URL: url!)
    //      webView.loadRequest(request)
    
    // using MessageUI: http://www.andrewcbancroft.com/2014/08/25/send-email-in-app-using-mfmailcomposeviewcontroller-with-swift/
    
//    let mailComposeViewController = configuredMailComposeViewController()
    
    let mailComposerVC = MFMailComposeViewController()
    mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
    mailComposerVC.setToRecipients(["iphone@systemsofmerritt.com"])
    mailComposerVC.setSubject(globalVars.DEV_EMAIL_SUB)
    mailComposerVC.setMessageBody("Hi Frank,<br><br><br><br><br>", isHTML: true)
    
    if MFMailComposeViewController.canSendMail() {
//    if mailComposerVC.canSendMail() {
      self.presentViewController(mailComposerVC, animated: true, completion: nil)
    } else {
      self.showSendMailErrorAlert()
    }
    
  }
  
  func showSendMailErrorAlert() {
    let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
    sendMailErrorAlert.show()
  }
  
  // MARK: MFMailComposeViewControllerDelegate Method
  func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
    controller.dismissViewControllerAnimated(true, completion: nil)
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2
  }
    
}
