import SwiftUI

struct ContentView: View {
    @StateObject var viewModelLeft: ResultViewModel = ResultViewModel()
    @StateObject var viewModelRight: ResultViewModel = ResultViewModel()

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            ViewThatFits(in: .horizontal) {
                DoubleCalculatorView(
                    viewModelLeft: viewModelLeft,
                    viewModelRight: viewModelRight
                )
                SingleCalculatorView(viewModel: viewModelLeft)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

