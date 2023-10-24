import SwiftUI

struct SingleCalculatorView: View {
    @StateObject var viewModel: ResultViewModel

    var body: some View {
        VStack {
            CalculatorView(
                viewModel: viewModel,
                orientation: .portrait
            )
        }
    }
}
