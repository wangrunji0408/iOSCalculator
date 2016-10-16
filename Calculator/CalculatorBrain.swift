//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 王润基 on 2016/10/16.
//  Copyright © 2016年 王润基. All rights reserved.
//

import Foundation

class CalculatorBrain
{
	private var accumulator = 0.0
	private var pending: PendingBinaryOperationInfo?
	var result: Double {
		get {return accumulator}
	}
	
	private struct PendingBinaryOperationInfo
	{
		var function: (Double, Double) -> Double
		var firstOperation: Double
	}
	
	private enum Operation
	{
		case Constant(Double)
		case UnaryOperation((Double) -> Double)
		case BinaryOperation((Double, Double) -> Double)
		case Equals
	}
	
	private let operations = [
		"π": Operation.Constant(M_PI),
		"e": Operation.Constant(M_E),
		"√": Operation.UnaryOperation(sqrt),
		"sin": Operation.UnaryOperation(sin),
		"cos": Operation.UnaryOperation(cos),
		"tan": Operation.UnaryOperation(tan),
		"+": Operation.BinaryOperation({ $0 + $1 }),
		"-": Operation.BinaryOperation({ $0 - $1 }),
		"×": Operation.BinaryOperation({ $0 * $1 }),
		"÷": Operation.BinaryOperation({ $0 / $1 }),
		"=": Operation.Equals,
	]
	
	func setOperand (operand: Double)
	{
		accumulator = operand
	}
	
	private func executePending ()
	{
		if pending != nil
		{
			accumulator = pending!.function(pending!.firstOperation, accumulator)
			pending = nil
		}
	}
	
	func performOperation (symbol: String)
	{
		if let operation = operations[symbol]
		{
			switch operation
			{
			case .Constant(let value):
				accumulator = value
			case .UnaryOperation(let function):
				accumulator = function(accumulator)
			case .BinaryOperation(let function):
				executePending()
				pending = PendingBinaryOperationInfo(function: function, firstOperation: accumulator)
			case .Equals:
				executePending()
			}
		}
	}
}
