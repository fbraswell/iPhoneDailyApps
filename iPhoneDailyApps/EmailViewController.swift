//
//  EmailViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 5/11/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {

  @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

      let globalVars = Globals()
      
      // Loading a webView: http://stackoverflow.com/questions/26647447/load-local-html-into-uiwebview-using-swift
      let fileName = globalVars.SHARE_SCREEN
//      let filePath = NSBundle.mainBundle().pathForResource(globalVars.SHARE_SCREEN, ofType: "html")
//      let url = NSURL.fileURLWithPath(filePath!)
//      let request = NSURLRequest(URL: url!)
//      webView.loadRequest(request)
      
      // using MessageUI: http://www.andrewcbancroft.com/2014/08/25/send-email-in-app-using-mfmailcomposeviewcontroller-with-swift/
      
      let mailComposeViewController = configuredMailComposeViewController()
      if MFMailComposeViewController.canSendMail() {
        self.presentViewController(mailComposeViewController, animated: true, completion: nil)
      } else {
        self.showSendMailErrorAlert()
      }
      
    }

  func configuredMailComposeViewController() -> MFMailComposeViewController {
    let globalVars = Globals()
    let mailComposerVC = MFMailComposeViewController()
    mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
    mailComposerVC.setToRecipients(["iphone@systemsofmerritt.com"])
    mailComposerVC.setSubject(globalVars.DEV_EMAIL_SUB)
    mailComposerVC.setMessageBody("Hi Frank,<br><br><br><br><br>", isHTML: false)
    
    return mailComposerVC
  }
  
  func showSendMailErrorAlert() {
    let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
    sendMailErrorAlert.show()
  }
  
  // MARK: MFMailComposeViewControllerDelegate Method
  func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
    Flurry.logEvent("email Sent") // FLURRY EVENT
    controller.dismissViewControllerAnimated(true, completion: nil)
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
