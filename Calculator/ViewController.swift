//
//  ViewController.swift
//  Calculator
//
//  Created by 王润基 on 2016/10/13.
//  Copyright © 2016年 王润基. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var label: UILabel!
	var typing = false;
	
	@IBAction func tapButton(_ sender: UIButton) {
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
	@IBAction func tap2(_ sender: UIButton) {
		if let title = sender.currentTitle
		{
			if title == "π"
			{
				label.text = String(M_PI)
			}
		}
	}

}

