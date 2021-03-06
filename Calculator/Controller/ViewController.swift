//
//  ViewController.swift
//  Calculator
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNymber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("Cannot convert display label text to a Double") }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }

    }
    
    private var calculatot = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNymber = true
        calculatot.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculatot.calculate(symbol: calcMethod) {
                 displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
    
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if let _ = displayLabel.text {
                if isFinishedTypingNymber && numValue != "." {
                    displayLabel.text = numValue
                    isFinishedTypingNymber = false
                } else {
                    if numValue == "." {
                        let isInt = floor(displayValue) == displayValue
                        if !isInt {
                            return
                        }
                    }
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
    }
}

