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
        
        // make it so bill amount field is first responder
        billField.becomeFirstResponder()
        billField.keyboardType = UIKeyboardType.decimalPad
    }

    @IBAction func onTap(_ sender: Any) {
        // dismiss hardware keyboard
        // view.endEditing(true)
        
        // make it so keyboard is always visible
        billField.keyboardType = UIKeyboardType.decimalPad
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
        
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
    }
}

