//
//  CalcFormTests.swift
//  ReduxExampleTests
//
//  Created by Egor Ledkov on 19.05.2024.
//

import XCTest
@testable import ReduxExample

final class CalcFormTests: XCTestCase {
	
	func test_increment_CountShouldBeIncrease() async {
		var sut = makeSut()
		
		sut.reduce(.incrementCount)
		let result = sut.count
		
		XCTAssertEqual(result, 1, "Count not increase")
	}
	
	func test_decrement_CountShouldBeDecrease() async {
		var sut = makeSut()
		
		sut.reduce(.decrementCount)
		let result = sut.count
		
		XCTAssertEqual(result, -1, "Count not decrease")
	}
}

// MARK: - makeSut

private extension CalcFormTests {
	
	func makeSut() -> CalcForm {
		CalcForm()
	}
}
