import SwiftUI

struct DoubleCalculatorView: View {
    @ObservedObject var viewModelLeft: ResultViewModel
    @ObservedObject var viewModelRight: ResultViewModel

    private struct Constants {
        static let buttonDimension = 55.0
        static let cornerRadius = 15.0
        static let spacerHeight = 100.0
        static let buttonFontSize = 30.0
    }

    var body: some View {
        HStack {
            CalculatorView(viewModel: viewModelLeft)
            VStack {
                Spacer()
                    .frame(height: Constants.spacerHeight)
                Button {
                    self.viewModelRight.moveOver(result: viewModelLeft.result)
                } label: {
                    Image("arrow_right")
                        .frame(
                            width: Constants.buttonDimension,
                            height: Constants.buttonDimension
                        )
                        .background(Color("arrow_background"))
                        .cornerRadius(Constants.cornerRadius)
                }
                Button {
                    self.viewModelLeft.moveOver(result: viewModelRight.result)
                } label: {
                    Image("arrow_left")
                        .frame(
                            width: Constants.buttonDimension,
                            height: Constants.buttonDimension
                        )
                        .background(Color("arrow_background"))
                        .cornerRadius(Constants.cornerRadius)
                }
                Spacer()
                Button {
                    self.viewModelRight.delete()
                    self.viewModelLeft.delete()
                } label: {
                    Text("DEL")
                        .font(.system(size: Constants.buttonFontSize))
                        .foregroundColor(Color.white)
                        .frame(
                            width: Constants.buttonDimension,
                            height: Constants.buttonDimension
                        )
                        .background(Color(.lightGray))
                        .cornerRadius(Constants.cornerRadius)
                }
            }
            CalculatorView(viewModel: viewModelRight)
        }
    }
}
