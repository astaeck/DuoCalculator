//  https://github.com/N3v1/Apple-Calculator-Rebuild/blob/main/Calculator_Rebuild/Calculator_Rebuild/ContentView.swift

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel: ResultViewModel
    
    private let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .division],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    private struct Constants {
        static let maxWidthText = 290.0
        static let minHeightTitle = 55.0
        static let minHeightSubtitle = 35.0
        static let maxWidth = 80.0
        static let maxWidthZero = 168.0
        static let minWidth = 60.0
        static let minWidthZero = 125.0
        static let maxHeight = 80.0
        static let minHeight = 50.0
        static let titleFontSize = 50.0
        static let subtitleFontSize = 30.0
        static let buttonFontSize = 35.0
        static let cornerRadius = 15.0
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Text("\(viewModel.result)")
                .font(.system(size: Constants.titleFontSize))
                .frame(
                    maxWidth: Constants.maxWidthText,
                    minHeight: Constants.minHeightTitle,
                    alignment: .trailing
                )
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Text("\(viewModel.computations)")
                .font(.system(size: Constants.subtitleFontSize))
                .frame(
                    maxWidth: Constants.maxWidthText,
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
                                    minWidth: item == .zero 
                                    ? Constants.minWidthZero
                                    : Constants.minWidth,
                                    maxWidth: item == .zero
                                    ? Constants.maxWidthZero
                                    : Constants.maxWidth,
                                    minHeight: Constants.minHeight,
                                    maxHeight: Constants.maxHeight
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
}
