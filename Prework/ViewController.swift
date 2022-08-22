//
//  ViewController.swift
//  Prework
//
//  Created by Preston Barney on 8/18/22.
//

import UIKit

class ViewController: UIViewController {

        
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.keyboardType = UIKeyboardType.numberPad
        self.title = "Tip Calculator"
        billAmountTextField.becomeFirstResponder()
        
        let currencyFormatter = NumberFormatter();
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current

        tipAmountLabel.text = currencyFormatter.string(for: 0.00)
        totalLabel.text = currencyFormatter.string(for: 0.00)
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let currencyFormatter = NumberFormatter();
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current

        // Update Tip Amount Label
        tipAmountLabel.text = currencyFormatter.string(for: tip)
        totalLabel.text = currencyFormatter.string(for: total)
        
    }
}

