import SwiftUI

enum CalcButton: Int {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equal, plus, minus, multiply, division
    case clear, negative, percent, decimal

    var title: String {
        switch self {
        case .equal: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .division: return "÷"
        case .clear: return "AC"
        case .negative: return "+/-"
        case .percent: return "%"
        case .decimal: return "."
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .zero: return "0"
        }
    }
    
    var buttonColor: Color {
        switch self {
        case .plus, .minus, .multiply, .division, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(
                UIColor(
                    red: 55/255.0,
                    green: 55/255.0,
                    blue: 55/255.0,
                    alpha: 1
                )
            )
        }
    }
    
    var fontColor: Color {
        return Color.white
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}
