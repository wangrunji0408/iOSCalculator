//
//  ViewController.swift
//  Calculator
//
//  Created by 王润基 on 2016/10/13.
//  Copyright © 2016年 王润基. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet private weak var label: UILabel!
	
	private var typing = false;
	private var brain = CalculatorBrain()
	
	private var currentNumber: Double {
		get {
			return Double(label.text!)!
		}
		set {
			label.text = String(newValue)
		}
	}
	
	@IBAction func labelAppend(_ sender: UIButton) {
		let title = sender.currentTitle!
		if typing
		{
			let currentText = label.text!
			label.text = currentText + title
		}
		else
		{
			label.text = title
		}
		typing = true
	}
	
	@IBAction func operation(_ sender: UIButton) {
		if typing
		{
			brain.setOperand(operand: currentNumber)
			typing = false
		}
		if let symbol = sender.currentTitle
		{
			brain.performOperation(symbol: symbol)
		}
		currentNumber = brain.result
	}

}

