//
//  ViewController.swift
//  iosTipCalculator
//
//  Created by peter on 10/19/18.
//  Copyright © 2018 petecit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // make it so bill amount field is first responder and decimal pad shows
        ShowDecimalPad()
        billField.becomeFirstResponder()
    }

    @IBAction func onTap(_ sender: Any) {
        // dismiss hardware keyboard (disable hw keyboard to emulate real life)
        // view.endEditing(true)
        
        // make it so keyboard is always visible
        ShowDecimalPad()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let TIP_FIFTEEN_PERCENT = 0.15
        let TIP_TWENTY_PERCENT = 0.20
        let TIP_TWENTY_FIVE_PERCENT = 0.25
        
        var tipPercent:Double
        
        if tipControl.selectedSegmentIndex == 0
        {
            tipPercent = TIP_FIFTEEN_PERCENT
        }
        else if tipControl.selectedSegmentIndex == 1
        {
            tipPercent = TIP_TWENTY_PERCENT
        }
        else
        {
            tipPercent = TIP_TWENTY_FIVE_PERCENT
        }
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent
        let total = bill + tip
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        let tipString = formatter.string(from: tip as NSNumber)!
        let totalString = formatter.string(from: total as NSNumber)!

        tipLabel.text = tipString
        totalLabel.text = totalString
    }
    
    func ShowDecimalPad()
    {
        billField.keyboardType = UIKeyboardType.default
        billField.keyboardType = UIKeyboardType.decimalPad
    }
}

