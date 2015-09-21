//
//  ViewController.swift
//  PiRazyOko
//
//  Created by Jan Kraus on 19/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  
  let initialValue: Int = 500
  
  var currentValue: Int = 500
  var targetValue: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    startNewRound()
    updateLabels()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // reset values for new round
  func startNewRound() {
    currentValue = initialValue
    slider.value = Float(initialValue)
    targetValue = 1 + Int(arc4random_uniform(1000))
  }
  
  // update labels
  func updateLabels() {
    targetLabel.text = String(targetValue)
  }
  
  
  
  // handle touch on main button
  @IBAction func showAlert() {
    
    let message = "Twoja wartość to \(currentValue)\n"
                + "Docelowa wartość \(targetValue)"
    
    // define alert controller
    let alert = UIAlertController(title: "Sprawdzenie:", message: message, preferredStyle: .Alert)
    
    // define alert action button
    let action = UIAlertAction(title: "Ok, jeszcze raz!", style: .Default, handler: nil)
    
    // connect button to alert
    alert.addAction(action)
    
    // execute
    presentViewController(alert, animated: true, completion: nil)
    
    // reset round
    startNewRound()
    updateLabels()
    
  }
  
  // handle slider change
  @IBAction func sliderMoved(slider: UISlider) {
    
    // get the value from the slider, round it
    currentValue = lroundf(slider.value)
    
  }
  


}

