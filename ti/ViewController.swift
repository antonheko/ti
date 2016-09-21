//
//  ViewController.swift
//  ti
//
//  Created by Anton Herasymenko on 9/15/16.
//  Copyright © 2016 Anton Herasymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.tintColor=UIColor.black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!)  ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "+%.2f", tip)
        totalLabel.text = String(format: "=%.2f", total)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        billField.text = ""
        calculateTip(billField)
    }
}
