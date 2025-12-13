//
//  Parser.swift
//  IOS_Calculator
//
//  Created by Герман Василевич on 20.11.25.
//

import Foundation

class Parser {
    static func toRPN(_ expression: String) -> [String] {
        var stack: [Character] = []
        var output: [String] = []
        var currentNumber: String = ""
        var previousChar: Character? = nil
        
        let expression = expression
            .replacingOccurrences(of: "√(", with: "q(")
            .replacingOccurrences(of: "sin(", with: "s(")
            .replacingOccurrences(of: "cos(", with: "c(")
            .replacingOccurrences(of: "ctg(", with: "g(")
            .replacingOccurrences(of: "tg(", with: "t(")
        
        let precedence: [Character: Int] = [
            "q": 3,
            "c": 3,
            "s": 3,
            "t": 3,
            "g": 3,
            "%": 2,
            "×": 2,
            "÷": 2,
            "+": 1,
            "–": 1
        ]
        
        for char in expression {
            if char.isNumber {
                currentNumber.append(char)
            } else if char == "," {
                currentNumber.append(".")
            }
            else {
                if !currentNumber.isEmpty {
                    output.append(currentNumber)
                    currentNumber = ""
                }
                
                let isUnary = (char == "-" && previousChar == nil || previousChar == "(")

                if isUnary {
                    output.append("0")
                    stack.append("~")
                }
                else if char == "(" {
                    stack.append(char)
                } else if char == ")" {
                    while let lastChar = stack.last, lastChar != "(" {
                        output.append(String(stack.removeLast()))
                    }
                    if stack.last == "(" {
                        stack.removeLast()
                    }
                    if let last = stack.last, precedence[last] == 3 {
                        output.append(String(stack.removeLast()))
                    }
                } else if let currentPrec = precedence[char] {
                    if currentPrec == 3 {
                        stack.append(char)
                    } else {
                        while let last = stack.last,
                              let lastPrec = precedence[last],
                              lastPrec >= currentPrec {
                            output.append(String(stack.removeLast()))
                        }
                        stack.append(char)
                    }
                }
            }
            previousChar = char
        }
        
        if !currentNumber.isEmpty {
            output.append(currentNumber)
        }
        
        while !stack.isEmpty {
            output.append(String(stack.removeLast()))
        }
        
        print(output)
        return output
    }
    
    
    static func changeFractionalPart(_ number: String) -> String {
        var newNumber = number
//        print("New number: \(newNumber)")
//        if newNumber.last! == "." {
//            newNumber.removeLast()
//            newNumber.removeLast()
//            return newNumber
//        }
//        if number.contains(".") {
//            print("Count: \(number.split(separator: ".").last!.count)")
//            print("Solver: \(Solver.numbersAfterPoint)")
//            if number.split(separator: ".").last!.count > Solver.numbersAfterPoint {
//                newNumber.removeLast(number.split(separator: ".").last!.count - Solver.numbersAfterPoint - 1)
//                if let lastChar = newNumber.popLast(), lastChar >= "5" {
//                    var lastNum = Int(String(newNumber.popLast()!))
//                    lastNum! += 1
//                    newNumber += String(lastNum!)
//                }
//            }
//            print("Before \(newNumber)")
//            if newNumber.last! == "." {
//                newNumber.removeLast()
//                return newNumber
//            }
            while newNumber.last! == "0" {
                newNumber.removeLast()
                if newNumber.last! == "," {
                    newNumber.removeLast()
                    break
                }
            }
//            print("After \(newNumber)")
//        }
        return newNumber
    }
}
