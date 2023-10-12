import SwiftUI

final class ResultViewModel: ObservableObject {
    @Published private(set) var result = "0"
    @Published private(set) var computations = ""
    private var currentOperation: Operation = .none
    private var runningNumber = 0
    private let digitCount = 8

    func moveOver(result: String) {
        self.result = result
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .plus, .minus, .multiply, .division, .equal:
            if button == .plus {
                currentOperation = .add
            } else if button == .minus {
                currentOperation = .subtract
            } else if button == .multiply {
                currentOperation = .multiply
            } else if button == .division {
                currentOperation = .divide
            } else if button == .equal {
                let runningValue = runningNumber
                let currentValue = Int(result) ?? 0
                switch currentOperation {
                case .add: result = "\(runningValue + currentValue)"
                case .subtract: result = "\(runningValue - currentValue)"
                case .multiply: result = "\(runningValue * currentValue)"
                case .divide: result = "\(runningValue / currentValue)"
                case .none: break
                }
            }
            runningNumber = Int(result) ?? 0
            if button != .equal {
                result = "0"
            }
        case .clear:
            result = "0"
            computations = ""
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.title
            if result == "0" {
                result = number
            } else {
                guard result.count <= digitCount else { return }
//                let concatenatedResult = "\(result)\(number)"
//                let formattedResult = (Int(concatenatedResult) ?? 0).formatted()
                result = "\(result)\(number)"
            }
        }
    }
}
