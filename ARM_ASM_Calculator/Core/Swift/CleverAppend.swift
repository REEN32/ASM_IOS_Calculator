extension String {
    mutating func cleverAppend(_ char:String) -> Void {
        let operators: Set<Character> = ["+", "–", "÷", "%", "×"]
        let numbers: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var lastNumIsFloat: Bool {
            guard !self.isEmpty else { return false }
            let components = self.split { operators.contains($0) }
            guard let lastComp = components.last else { return false }
            return lastComp.contains(",")
        }
        
        
        switch char {
        case "+", "–", "÷", "%", "×":
            if self.isEmpty {
                return
            }
            let last = self.last!
            if last == "," {
                self.append("0")
                self.append(char)
                return
            }
            if operators.contains(last) {
                self.removeLast()
                self.append(char)
                return
            }
            else {
                self.append(char)
            }
        case ",":
            if self.isEmpty || lastNumIsFloat {
                return
            }
            let last = self.last!
            if numbers.contains(last) {
                self.append(char)
            }
            return
        default:
            self.append(char)
            return
        }
    }
}
