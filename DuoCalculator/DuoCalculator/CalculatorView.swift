//  https://github.com/N3v1/Apple-Calculator-Rebuild/blob/main/Calculator_Rebuild/Calculator_Rebuild/ContentView.swift

import SwiftUI

enum Orientation {
    case landscape
    case portrait
}

struct CalculatorView: View {
    @ObservedObject var viewModel: ResultViewModel
    let orientation: Orientation
    
    private let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .division],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    private struct Constants {
        static let maxWidthText = 290.0
        static let minWidthText = 320.0
        static let minHeightTitle = 40.0
        static let maxHeightTitle = 50.0
        static let minHeightSubtitle = 40.0

        static let maxWidth = 80.0
        static let maxWidthZero = 168.0
        static let minWidth = 65.0
        static let minWidthZero = 135.0
        static let maxHeight = 80.0
        static let minHeight = 50.0
    
        static let titleFontSize = 50.0
        static let subtitleFontSize = 25.0
        static let buttonFontSize = 35.0
        static let cornerRadius = 15.0
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Text("\(viewModel.result)")
                .font(.system(size: Constants.titleFontSize))
                .frame(
                    minWidth: textWidth(),
                    maxWidth: textWidth(),
                    minHeight: titleHeight(),
                    alignment: .trailing
                )
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Text("\(viewModel.computations)")
                .font(.system(size: Constants.subtitleFontSize))
                .frame(
                    minWidth: textWidth(),
                    maxWidth: textWidth(),
                    minHeight: Constants.minHeightSubtitle,
                    alignment: .leading
                )
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(5)
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 5) {
                    ForEach(row, id: \.self) { item in
                        Button {
                            self.viewModel.didTap(button: item)
                        } label: {
                            Text(item.title)
                                .font(.system(size: Constants.buttonFontSize))
                                .frame(
                                    width: buttonWidth(item: item),
                                    height: buttonHeight()
                                )
                                .background(item.buttonColor)
                                .foregroundColor(item.fontColor)
                                .cornerRadius(Constants.cornerRadius)
                        }
                    }
                }
            }
        }
    }
    
    private func buttonWidth(item: CalcButton) -> CGFloat {
        guard orientation == .landscape else {
            return item == .zero
            ? Constants.maxWidthZero
            : Constants.maxWidth
        }
        return item == .zero
        ? Constants.minWidthZero
        : Constants.minWidth
    }
    
    private func buttonHeight() -> CGFloat {
        guard orientation == .landscape else {
            return Constants.maxHeight
        }
        return Constants.minHeight
    }
    
    private func textWidth() -> CGFloat {
        guard orientation == .landscape else {
            return Constants.minWidthText
        }
        return Constants.maxWidthText
    }
    
    private func titleHeight() -> CGFloat {
        guard orientation == .landscape else {
            return Constants.maxHeightTitle
        }
        return Constants.minHeightTitle
    }
}
