import SwiftUI

final class ResultViewModel: ObservableObject {
    @Published private(set) var result = "0"
    @Published private(set) var computations = ""
    private var currentOperation: Operation = .none
    private var runningNumber: CGFloat = 0.0
    private var currentValue: CGFloat = 0.0
    private let digitCount = 8

    func moveOver(result: String) {
        self.result = result
    }
    
    func delete() {
        clearAll()
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .percent:
            result = formattedString((currentValue * runningNumber) / 100)
            currentValue = formattedFloat(result)
        case .equal:
            calculateResult()
            runningNumber = formattedFloat(result)
            currentOperation = .none
        case .plus, .minus, .multiply, .division:
            if currentOperation != .none {
                calculateResult()
            }
            runningNumber = formattedFloat(result)
            if button == .plus {
                currentOperation = .add
            } else if button == .minus {
                currentOperation = .subtract
            } else if button == .multiply {
                currentOperation = .multiply
            } else if button == .division {
                currentOperation = .divide
            }
            
        case .clear:
            clearAll()
        case .decimal:
            guard result.contains(".") == false else { return }
            result.append(".")
        case .negative:
            let number = formattedFloat(result) * -1
            result = formattedString(number)
        default:
            let number = button.title
            if result == "0" || runningNumber == formattedFloat(result) {
                result = number
            } else {
                guard result.count <= digitCount else { return }
                result = "\(result)\(number)"
            }
            currentValue = formattedFloat(result)
        }
    }
}

private extension ResultViewModel {
    func calculateResult() {
        if runningNumber != 0 {
            switch currentOperation {
            case .add: result = formattedString(runningNumber + currentValue)
            case .subtract: result = formattedString(runningNumber - currentValue)
            case .multiply: result = formattedString(runningNumber * currentValue)
            case .divide: result = formattedString(runningNumber / currentValue)
            case .none:
                break
            }
        }
    }
    
    func clearAll() {
        result = "0"
        computations = ""
        runningNumber = 0
        currentOperation = .none
    }

    func formattedString(_ value: CGFloat) -> String {
        let number = NSNumber(value: value)
        return Self.valueFormatter.string(from: number) ?? "0"
    }
    
    func formattedFloat(_ value: String) -> CGFloat {
        guard let number = Self.valueFormatter.number(from: value) else { return 0.0 }
        return CGFloat(truncating: number)
    }

    static var valueFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}
