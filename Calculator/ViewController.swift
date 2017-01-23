//
//  ViewController.swift
//  Calculator
//
//  Created by Yatin on 17/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//  Simple calculator applicaion, can perform +,-,/,X and square root of a 
//  number.

import UIKit

class ViewController: UIViewController {

    //Result labe reference
    @IBOutlet weak var resultLabel: UILabel!
    //Instance variables used in performing calculation
    var firstNumberText = ""
    var secondNumberText = ""
    var op = "+"
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Handling button press on calculator screen
    @IBAction func handleButtonPress(_ sender: UIButton) {
        if canClear {
            resultLabel.text = ""
            canClear = false
        }
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "X", "/", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLabel.text = "\(currentText) \(op) "
                break
            case "sqr":
                if hasOp {
                    return
                }
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculateSquareRoot()
                resultLabel.text = "\(result)"
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                resultLabel.text = "\(result)"
                break
            case "AC":
                resultLabel.text = "0.0"
                isFirstNumber = true
                hasOp = false
                canClear = true
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
    //performing Squareroot calculation
    func calculateSquareRoot() -> Double{
        let firstNumber = firstNumberText != "" ?Double(firstNumberText)!:0.0
        firstNumberText = ""
        return sqrt(firstNumber)
    }
    
    //performing +,-,/,X on two numbers
    func calculate() -> Double {
        let firstNumber = firstNumberText != "" ?Double(firstNumberText)!:0.0
        let secondNumber = secondNumberText != "" ?Double(secondNumberText)!:0.0
//        let secondNumber = Double(secondNumberText)!
//        let secondNumber = Double(secondNumberText)!
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "X":
            return firstNumber * secondNumber
        case "/":
            return firstNumber / secondNumber
        default:
            return 0.0
        }
    }


}

