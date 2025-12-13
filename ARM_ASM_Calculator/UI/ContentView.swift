import SwiftUI

struct ContentView: View {
    @State var calculateLine: String = ""
    @State var result:Int = 0
    @State var page: Bool = false
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(page ? "2" : "1") {
                        page = !page
                    }
                    .font(.system(size: 36, weight: .medium))
                    .frame(width: 80, height: 80)
                    .buttonStyle(.plain)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(40)
                    .padding(20)
                }
                Spacer()
                HStack {
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            Text(calculateLine)
                                .font(.system(size: 62, weight: .medium))
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .id("calcText")
                                .padding(.leading, 350)
                                .padding(.trailing, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onChange(of: calculateLine) {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                proxy.scrollTo("calcText", anchor: .trailing)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, -10)
                
                Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                    GridRow {
                        Button(action: {
                            if !calculateLine.isEmpty {
                                calculateLine.removeLast()
                            }
                        } ) {
                            Image(systemName: "delete.backward")
                                .offset(x: -2, y: 0)
                                .frame(width: 84, height: 84)
                                .buttonStyle(.plain)
                                .background(Color.gray.opacity(0.7))
                                .cornerRadius(42)
                                .font(.system(size: 36))
                        }
                        Button("C") {
                            calculateLine.removeAll()
                        }
                        .font(.system(size: 50, weight: .medium))
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.7))
                        .cornerRadius(42)
                        if !page {
                            Button("%") {
                                calculateLine.cleverAppend("%")
                            }
                            .frame(width: 84, height: 84)
                            .buttonStyle(.plain)
                            .background(Color.gray.opacity(0.7))
                            .cornerRadius(42)
                        } else {
                            Button(action: {
                                let operators: Set<Character> = ["+", "–", "÷", "%", "×"]
                                guard !calculateLine.isEmpty else { return }
                                guard !operators.contains(calculateLine.last!) else { return }
                                let splitStr = calculateLine.split { operators.contains($0) }
                                print(splitStr)
                                var lastSplit = splitStr.last!
                                if lastSplit.hasSuffix(",") {
                                    lastSplit.append("0")
                                    calculateLine.removeLast(lastSplit.count - 1)
                                }
                                else {
                                    calculateLine.removeLast(lastSplit.count)
                                }
                                calculateLine += "√(\(lastSplit))" } ) {
                                    Image(systemName: "radicand.squareroot")
                                }
                                .font(.system(size: 42, weight: .medium))
                                .frame(width: 84, height: 84)
                                .buttonStyle(.plain)
                                .background(Color.gray.opacity(0.7))
                                .cornerRadius(42)
                        }
                        
                        if !page {
                            Button(action: { calculateLine.cleverAppend("÷") } ) {
                                Image(systemName: "divide")
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.orange.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        } else {
                            Button(action: {
                                let operators: Set<Character> = ["+", "–", "÷", "%", "×"]
                                guard !calculateLine.isEmpty else { return }
                                guard !operators.contains(calculateLine.last!) else { return }
                                let splitStr = calculateLine.split { operators.contains($0) }
                                print(splitStr)
                                var lastSplit = splitStr.last!
                                if lastSplit.hasSuffix(",") {
                                    lastSplit.append("0")
                                    calculateLine.removeLast(lastSplit.count - 1)
                                }
                                else {
                                    calculateLine.removeLast(lastSplit.count)
                                }
                                calculateLine += "sin(\(lastSplit))"
                            } ) {
                                Text("sin")
                                    .offset(x: 0, y: -2)
                                    .font(.system(size: 36, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .buttonStyle(.plain)
                                    .background(Color.orange.opacity(0.9))
                                    .cornerRadius(42)
                            }
                        }
                        
                    }
                    GridRow {
                        Button("7") {
                            calculateLine.cleverAppend("7")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        Button("8") {
                            calculateLine.cleverAppend("8")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        Button("9") {
                            calculateLine.cleverAppend("9")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        
                        if !page {
                            Button(action: { calculateLine.cleverAppend("×") } ) {
                                Image(systemName: "multiply")
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.orange.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        } else {
                            Button(action: {
                                let operators: Set<Character> = ["+", "–", "÷", "%", "×"]
                                guard !calculateLine.isEmpty else { return }
                                guard !operators.contains(calculateLine.last!) else { return }
                                let splitStr = calculateLine.split { operators.contains($0) }
                                print(splitStr)
                                var lastSplit = splitStr.last!
                                if lastSplit.hasSuffix(",") {
                                    lastSplit.append("0")
                                    calculateLine.removeLast(lastSplit.count - 1)
                                }
                                else {
                                    calculateLine.removeLast(lastSplit.count)
                                }
                                calculateLine += "cos(\(lastSplit))"
                            } ) {
                                Text("cos")
                                    .offset(x: 0, y: -2)
                                    .font(.system(size: 36, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .buttonStyle(.plain)
                                    .background(Color.orange.opacity(0.9))
                                    .cornerRadius(42)
                            }
                        }
                    }
                    GridRow {
                        Button("4") {
                            calculateLine.cleverAppend("4")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        Button("5") {
                            calculateLine.cleverAppend("5")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        Button("6") {
                            calculateLine.cleverAppend("6")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        
                        if !page {
                            Button(action: { calculateLine.cleverAppend("–") } ) {
                                Image(systemName: "minus")
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.orange.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        } else {
                            Button(action: {
                                let operators: Set<Character> = ["+", "–", "÷", "%", "×"]
                                guard !calculateLine.isEmpty else { return }
                                guard !operators.contains(calculateLine.last!) else { return }
                                let splitStr = calculateLine.split { operators.contains($0) }
                                print(splitStr)
                                var lastSplit = splitStr.last!
                                if lastSplit.hasSuffix(",") {
                                    lastSplit.append("0")
                                    calculateLine.removeLast(lastSplit.count - 1)
                                }
                                else {
                                    calculateLine.removeLast(lastSplit.count)
                                }
                                calculateLine += "tg(\(lastSplit))"
                            } ) {
                                Text("tg")
                                    .offset(x: 0, y: -2)
                                    .font(.system(size: 36, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .buttonStyle(.plain)
                                    .background(Color.orange.opacity(0.9))
                                    .cornerRadius(42)
                            }
                        }
                    }
                    GridRow {
                        Button("1") {
                            calculateLine.cleverAppend("1")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        Button("2") {
                            calculateLine.cleverAppend("2")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        Button("3") {
                            calculateLine.cleverAppend("3")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        
                        if !page {
                            Button(action: { calculateLine.cleverAppend("+") } ) {
                                Image(systemName: "plus")
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.orange.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        } else {
                            Button(action: {
                                let operators: Set<Character> = ["+", "–", "÷", "%", "×"]
                                guard !calculateLine.isEmpty else { return }
                                guard !operators.contains(calculateLine.last!) else { return }
                                let splitStr = calculateLine.split { operators.contains($0) }
                                print(splitStr)
                                var lastSplit = splitStr.last!
                                if lastSplit.hasSuffix(",") {
                                    lastSplit.append("0")
                                    calculateLine.removeLast(lastSplit.count - 1)
                                }
                                else {
                                    calculateLine.removeLast(lastSplit.count)
                                }
                                calculateLine += "ctg(\(lastSplit))"
                            } ) {
                                Text("ctg")
                                    .offset(x: 0, y: -2)
                                    .font(.system(size: 36, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .buttonStyle(.plain)
                                    .background(Color.orange.opacity(0.9))
                                    .cornerRadius(42)
                            }
                        }
                    }
                    GridRow {
                        Button(action: {
                            let operators: Set<Character> = ["+", "–", "÷", "%", "×"]
                            guard !calculateLine.isEmpty else { return }
                            guard !operators.contains(calculateLine.last!) else { return }
                            let splitStr = calculateLine.split { operators.contains($0) }
                            print(splitStr)
                            var lastSplit = splitStr.last!
                            if lastSplit.hasSuffix(",") {
                                lastSplit.append("0")
                                calculateLine.removeLast(lastSplit.count - 1)
                            }
                            else {
                                calculateLine.removeLast(lastSplit.count)
                            }
                            calculateLine += "(–\(lastSplit))"
                        } ) {
                            Image(systemName: "plus.forwardslash.minus")
                                .font(.system(size: 46, weight: .medium))
                                .frame(width: 84, height: 84)
                                .background(Color.gray.opacity(0.4))
                                .foregroundColor(.white)
                                .cornerRadius(42)
                        }
                        Button("0") {
                            calculateLine.cleverAppend("0")
                        }
                        .frame(width: 84, height: 84)
                        .buttonStyle(.plain)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(42)
                        
                        if !page {
                            Button(action: { calculateLine.cleverAppend(",") } ) {
                                Text(",")
                                    .offset(x: 0, y: -2)
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.gray.opacity(0.4))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        } else {
                            Button(action: { calculateLine.cleverAppend("(") } ) {
                                Text("(")
                                    .offset(x: 0, y: -2)
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.gray.opacity(0.4))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        }
                        if !page {
                            Button(action: {
                                Solver.numbersAfterPoint = 0;
                                calculateLine = Parser.changeFractionalPart(Solver.caclulate(Parser.toRPN(calculateLine)))
                            }) {
                                Image(systemName: "equal")
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.orange.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        } else {
                            Button(action: { calculateLine.cleverAppend(")") } ) {
                                Text(")")
                                    .offset(x: 0, y: -2)
                                    .font(.system(size: 46, weight: .medium))
                                    .frame(width: 84, height: 84)
                                    .background(Color.orange.opacity(0.9))
                                    .foregroundColor(.white)
                                    .cornerRadius(42)
                            }
                        }
                    }
                }
                .font(Font.system(size: 54))
                .background(Color.black)
                .cornerRadius(15)
                .padding()
                .foregroundStyle(.white)
            }
        }
    }
}



#Preview {
    ContentView()
}

