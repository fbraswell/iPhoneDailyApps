//
//  HelpTableTableViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/9/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit
import MessageUI

class HelpViewController: UITableViewController, MFMailComposeViewControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Help & Info"
    //      self.navigationController?.setNavigationBarHidden(false, animated: false)
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //      self.navigationItem.rightBarButtonItem = self.editButtonItem()
    //      self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    println("segue time")
    if segue.identifier == "EmailShare" {
      println("--email Share")
      shareEmail("Share")
    } else if segue.identifier == "EmailFrank" {
      println("--email Frank")
      sendEmailFrank("email Frank")
    }
    
  }
  
  @IBAction func shareEmail(sender: AnyObject) {
    println("share email")
    
    let globalVars = Globals()
    
    let psalmData = PsalmData()
    let imageRef = psalmData.PsalmImage() 
    let psalmRef = psalmData.PsalmQuote()
    
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

  @IBAction func sendEmailFrank(sender: AnyObject) {
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
  
//  func configuredMailComposeViewController() -> MFMailComposeViewController {
//    let globalVars = Globals()
//    let mailComposerVC = MFMailComposeViewController()
//    mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
//    
//    mailComposerVC.setToRecipients(["iphone@systemsofmerritt.com"])
//    mailComposerVC.setSubject(globalVars.DEV_EMAIL_SUB)
//    mailComposerVC.setMessageBody("Hi Frank,<br><br><br><br><br>", isHTML: true)
//    
//    return mailComposerVC
//  }
  
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
  
  //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //        // #warning Incomplete method implementation.
  //        // Return the number of rows in the section.
  //        return 3
  //    }
  
  /*
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
  
  // Configure the cell...
  
  return cell
  }
  */
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return NO if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return NO if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
  
}
