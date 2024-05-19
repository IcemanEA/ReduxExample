//
//  LoginMiddlewareTests.swift
//  ReduxExampleTests
//
//  Created by Egor Ledkov on 19.05.2024.
//

import XCTest
@testable import ReduxExample

final class LoginMiddlewareTests: XCTestCase {
	
	func test_logout_WillGoToLoginScene() async {
		let sut = makeSut(.done)
		
		let result = await sut.callAsFunction(action: .logout)
		
		XCTAssertEqual(result, .routeToLogin, "No login screen")
	}
	
	func test_login_WillGoToCalcScene() async {
		let sut = makeSut(.done)
		
		let result = await sut.callAsFunction(action: .login("2", "2"))
		
		XCTAssertEqual(result, .routeToCalc, "No calc screen")
	}
	
	func test_login_WillRouteError() async {
		let sut = makeSut(.error(NetworkService.Error.badCredential))
		
		let result = await sut.callAsFunction(action: .login("", ""))
		let error: AppAction = .error(NetworkService.Error.badCredential.errorDescription!)
		
		XCTAssertEqual(result, error, "No throw error")
	}
}

// MARK: - makeSut

private extension LoginMiddlewareTests {
	
	func makeSut(_ mode: DIMode) -> LoginMiddleware {
		let networkService: INetworkService = NetworkServiceMock(mode: mode)
		return LoginMiddleware(networkService: networkService)
	}
}
