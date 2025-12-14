import Foundation

@_silgen_name("add_floats")
func add_floats(_ a: Float, _ b: Float) -> Float

@_silgen_name("sub_floats")
func sub_floats(_ a: Float, _ b: Float) -> Float

@_silgen_name("mul_floats")
func mul_floats(_ a: Float, _ b: Float) -> Float

@_silgen_name("div_floats")
func div_floats(_ a: Float, _ b: Float) -> Float

@_silgen_name("sin_floats")
func sin_floats(_ a: Float) -> Float

@_silgen_name("cos_floats")
func cos_floats(_ a: Float) -> Float

@_silgen_name("tg_floats")
func tg_floats(_ a: Float) -> Float

@_silgen_name("sqrt_floats")
func sqrt_floats(_ a: Float) -> Float

class Solver {
    static private var _numbersAfterPoint: Int = 0
    static var numbersAfterPoint: Int {
        get {
            return _numbersAfterPoint
        }
        set {
            _numbersAfterPoint = newValue
        }
    }
    
    static func caclulate(_ expression: [String]) -> String {
        var stack: [String] = []
        for item in expression {
            if item.contains(".") {
                _numbersAfterPoint += item.split(separator: ".").last!.count 
            }
            switch item {
            case "~", "–":
                let secondNumber = Float(stack.removeLast())!
                let tempResult = sub_floats(Float(stack.removeLast())!, Float(secondNumber))
                stack.append(String(tempResult))
            case "+":
                let secondNumber = Float(stack.removeLast())!
                let tempResult = add_floats(Float(stack.removeLast())!, Float(secondNumber))
                stack.append(String(tempResult))
            case "×":
                let secondNumber = Float(stack.removeLast())!
                let tempResult = mul_floats(Float(stack.removeLast())!, Float(secondNumber))
                stack.append(String(tempResult))
            case "÷":
                let secondNumber = Float(stack.removeLast())!
                let tempResult = div_floats(Float(stack.removeLast())!, Float(secondNumber))
                stack.append(String(tempResult))
            case "%":
                let secondNumber = Float(stack.removeLast())!
                let firstNumber = Float(stack.removeLast())!
                let multiplier = Int(div_floats(Float(firstNumber), Float(secondNumber)))
                let tempResult = sub_floats(Float(firstNumber), mul_floats(Float(multiplier), Float(secondNumber)))
                stack.append(String(tempResult))
            case "s":
                let tempResult = sin_floats(Float(stack.removeLast())!)
                stack.append(String(tempResult))
            case "c":
                let tempResult = cos_floats(Float(stack.removeLast())!)
                stack.append(String(tempResult))
            case "t":
                let last = Float(stack.removeLast())!
                let tempResult = Float(sin_floats(last) / cos_floats(last))
                stack.append(String(tempResult))
            case "g":
                let last = Float(stack.removeLast())!
                let tempResult = Float(cos_floats(last) / sin_floats(last))
                stack.append(String(tempResult))
            case "q":
                let tempResult = sqrt_floats(Float(stack.removeLast())!)
                stack.append(String(tempResult))
            default:
                stack.append(item)
                break
            }
        }
        print(stack)
        return stack.joined().replacingOccurrences(of: ".", with: ",")
    }
}
