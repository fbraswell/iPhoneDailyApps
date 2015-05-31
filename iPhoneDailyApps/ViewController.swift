//
//  ViewController.swift
//  iPhoneDailyApps
//
//  Created by Frank Braswell on 4/29/15.
//  Copyright (c) 2015 Systems of Merritt, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageArea: UIImageView!
  @IBOutlet weak var psalmText: UIWebView!
  
 // var global1: Globals!
  var psalmInfo: PsalmData!
  
  @IBAction func infoButton(sender: UIButton) {
    Flurry.logEvent("Info Button") // FLURRY EVENT
    //    println("-info button")
  }
  
  @IBAction func topButton(sender: AnyObject) {
    psalmInfo.getNextQuoteIndex(nextQuote.Random)
    changeView()
    //    println("-top button")
  }
  
  @IBAction func rightButton(sender: UIButton) {
    psalmInfo.getNextQuoteIndex(nextQuote.Forward)
    changeView()
    //    println("-right button")
  }
  
  @IBAction func leftButton(sender: UIButton) {
    psalmInfo.getNextQuoteIndex(nextQuote.Backward)
    changeView()
    //    println("-left button")
  }
  
  @IBOutlet var rightForward: UISwipeGestureRecognizer!
  //  rightForward.direction = UISwipeGestureRecognizerDirection.Right
  
  // Swipe forward is to the right
  @IBAction func handleSwipeForward(recognizer: UISwipeGestureRecognizer ) {
    println("gesture swipe forward")
    
    if( recognizer.direction == UISwipeGestureRecognizerDirection.Right) {
      //      println(">>>>> to right")
      psalmInfo.getNextQuoteIndex(nextQuote.Forward)
      changeView()
    }
  }
  
  @IBOutlet var leftBackward: UISwipeGestureRecognizer!
  //  leftBackward.direction = UISwipeGestureRecognizerDirection.Left
  
  // Swipe backward is to the left
  @IBAction func handleSwipeBackward(recognizer: UISwipeGestureRecognizer ) {
    println("gesture swipe backward")
    
    if( recognizer.direction == UISwipeGestureRecognizerDirection.Left) {
      //        println("<<<<<< to left")
      psalmInfo.getNextQuoteIndex(nextQuote.Backward)
      changeView()
    }
  }

  let animationDuration: NSTimeInterval = 1.0
  
  func changeView(){
    Flurry.logEvent("Change View") // FLURRY EVENT
    psalmInfo = PsalmData.sharedInstance
    // fetch quote
    let quote = psalmInfo.PsalmQuote()
    
    // fetch image
    let imageName = psalmInfo.PsalmImage() + ".jpg"// get image name
    let myImage = UIImage(named: imageName) // create UIImage object
    
    // Animation info at http://stackoverflow.com/questions/26898955/adding-image-transition-animation-in-swift
    
    CATransaction.begin()
    CATransaction.setAnimationDuration(animationDuration)
    let transition = CATransition()
    transition.type = kCATransitionFade
    
    psalmText.layer.addAnimation(transition, forKey: kCATransition)
    
    // Make the HTML text bold
    psalmText.loadHTMLString("<b>"+quote+"</b>", baseURL: nil)
    
    imageArea.layer.addAnimation(transition, forKey: kCATransition)
    imageArea.image = myImage // place image
    CATransaction.commit() // perform transition
    
  } // end changeView()

  override func viewDidLoad() {
    super.viewDidLoad()
      // set the first view
    changeView()
  } // end viewDidLoad
  
  override func viewWillAppear(animated: Bool) {
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    changeView()
  }
  
  override func viewWillDisappear(animated: Bool) {
    self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

