import Foundation

class DecimalFormatter {
    static func changeFractionalPart(_ number: String) -> String {
        var newNumber = number
            while newNumber.last! == "0" {
                newNumber.removeLast()
                if newNumber.last! == "," {
                    newNumber.removeLast()
                    break
                }
            }
        return newNumber
    }
}
