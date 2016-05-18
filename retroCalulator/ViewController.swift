//
//  ViewController.swift
//  retroCalulator
//
//  Created by skwong on 5/13/16.
//  Copyright © 2016 fedup. All rights reserved.
//

import UIKit

class ViewController: UIViewController

{
    enum Operation: String
    {
        case Divide = "/"
        case Multiply = "*"
        case Subract = "-"
        case Add = "+"
        case Empty = "Empty" //Use this for when no operator has been entered
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var currentOperation: Operation = Operation.Empty
    
    
    override func viewDidLoad()
        {
        super.viewDidLoad()
        }

    @IBAction func numberPressed(btn: UIButton!)
        {
            runningNumber = runningNumber + "\(btn.tag)"
            outputLbl.text = runningNumber
            
        }
    
    
    func processOperation(op: Operation)
        {
            if currentOperation != Operation.Empty
            {
            
                
                if runningNumber != ""
                {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Divide
                {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Multiply
                {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Subract
                {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Add
                {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
                    
                }
                
                currentOperation = op
                
            }
            else
            {
                //This is the first time an operator has been pressed
                leftValStr = runningNumber
                runningNumber = ""
                currentOperation = op
            }
        }

    @IBAction func onDividePressed(sender: AnyObject)
        {
            processOperation(Operation.Divide)
        }
 
    @IBAction func onMultiplyPressed(sender: AnyObject)
        {
            processOperation(Operation.Multiply)
        }
    @IBAction func onSubtractPressed(sender: AnyObject)
        {
            processOperation(Operation.Subract)
        }
    @IBAction func onAddPressed(sender: AnyObject)
        {
            processOperation(Operation.Add)
        }
    @IBAction func onEqualPressed(sender: AnyObject)
        {
            processOperation(currentOperation)

            
        }
    @IBAction func onClearPressed(sender: AnyObject)
    {
        outputLbl.text = "0"
        var runningNumber = ""
        var leftValStr = ""
        var rightValStr = ""
        var result = ""
        var currentOperation: Operation = Operation.Empty
    }
}




