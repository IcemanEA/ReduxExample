//
//  ReduxExampleTests.swift
//  ReduxExampleTests
//
//  Created by Egor Ledkov on 19.05.2024.
//

import XCTest
@testable import ReduxExample

final class ReduxExampleTests: XCTestCase {
	
	func test_actions_CountShouldBeActual() async {
		let sut = AppAction.allCases
		
		let result = sut.count
		
		XCTAssertEqual(result, 13, "Count of actions has changed")
	}
}
