//
//  ViewController.swift
//  PiRazyOko
//
//  Created by Jan Kraus on 19/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue: Int = 500
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // handle touch on main button
  @IBAction func showAlert() {
    
    let message = "Twoja wartość to \(currentValue)"
    
    // define alert controller
    let alert = UIAlertController(title: "Sprawdzenie:", message: message, preferredStyle: .Alert)
    
    // define alert action button
    let action = UIAlertAction(title: "Ok, jeszcze raz!", style: .Default, handler: nil)
    
    // connect button to alert
    alert.addAction(action)
    
    // execute
    presentViewController(alert, animated: true, completion: nil)
    
  }
  
  // handle slider change
  @IBAction func sliderMoved(slider: UISlider) {
    
    // get the value from the slider, round it
    currentValue = lroundf(slider.value)
    
  }
  


}

