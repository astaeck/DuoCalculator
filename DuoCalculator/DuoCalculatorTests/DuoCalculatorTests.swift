import XCTest
@testable import DuoCalculator

final class DuoCalculatorTests: XCTestCase {
    private var sut: ResultViewModel!

    override func setUpWithError() throws {
        sut = ResultViewModel()
    }

    func test_didTap_calculatesPercentageOfNumber() {
        // GIVEN
        sut.didTap(button: .five)
        sut.didTap(button: .zero)

        // WHEN
        sut.didTap(button: .percent)
        
        // THEN
        XCTAssertEqual(sut.result, "0.5")
    }
    
    func test_didTap_calculatesAdditionOfNumbers() {
        // GIVEN
        sut.didTap(button: .nine)
        sut.didTap(button: .decimal)
        sut.didTap(button: .three)

        // WHEN
        sut.didTap(button: .plus)
        sut.didTap(button: .eight)
        sut.didTap(button: .decimal)
        sut.didTap(button: .four)
        sut.didTap(button: .equal)

        // THEN
        XCTAssertEqual(sut.result, "17.7")
    }
    
    func test_didTap_calculatesSubtractionOfNumbers() {
        // GIVEN
        sut.didTap(button: .two)
        sut.didTap(button: .one)

        // WHEN
        sut.didTap(button: .minus)
        sut.didTap(button: .six)
        sut.didTap(button: .equal)

        // THEN
        XCTAssertEqual(sut.result, "15")
    }
    
    func test_didTap_calculatesMultiplicationOfNumbers() {
        // GIVEN
        sut.didTap(button: .seven)
        sut.didTap(button: .decimal)
        sut.didTap(button: .one)

        // WHEN
        sut.didTap(button: .multiply)
        sut.didTap(button: .two)
        sut.didTap(button: .equal)

        // THEN
        XCTAssertEqual(sut.result, "14.2")
    }
    
    func test_didTap_calculatesDivisionOfNumbers() {
        // GIVEN
        sut.didTap(button: .three)
        sut.didTap(button: .five)
        sut.didTap(button: .zero)

        // WHEN
        sut.didTap(button: .division)
        sut.didTap(button: .one)
        sut.didTap(button: .zero)
        sut.didTap(button: .equal)

        // THEN
        XCTAssertEqual(sut.result, "35")
    }
    
    func test_didTap_negativeValueOfNumber() {
        // GIVEN
        sut.didTap(button: .three)

        // WHEN
        sut.didTap(button: .negative)

        // THEN
        XCTAssertEqual(sut.result, "-3")
    }
    
    func test_didTap_clear() {
        // GIVEN
        sut.didTap(button: .five)

        // WHEN
        sut.didTap(button: .clear)

        // THEN
        XCTAssertEqual(sut.result, "0")
    }
    
    func test_moveOver_showsNewResult() {
        // GIVEN
        sut.didTap(button: .two)

        // WHEN
        sut.moveOver(result: "34,567.93")

        // THEN
        XCTAssertEqual(sut.result, "34,567.93")
    }
    
    func test_didTap_showAllComputations() {
        // GIVEN
        sut.didTap(button: .two)
        XCTAssertEqual(sut.computations, "")

        // WHEN
        sut.didTap(button: .minus)
        sut.didTap(button: .five)
        sut.didTap(button: .equal)

        // THEN
        XCTAssertEqual(sut.computations, "2 - 5")
    }
}
