//
//  AppAction.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 16.05.2024.
//

import AsyncRedux

typealias ApplicationStore = Store<ApplicationState, AppAction>

enum AppAction: Hashable, Equatable {
	
	// MARK: - Routing
	
	case routeToLogin
	case routeToCalc

	// MARK: - LoginScene
	
	case updateUsername(String)
	case updatePassword(String)
	case login(String, String)
	case logInButtonTapped
	case setAccessToken(String)
	case loginProcess
	case logout

	// MARK: - CalcScene
	
	case incrementCount
	case decrementCount
	
	
	// MARK: - Error handling
	
	case error(String)
	case cleanError
}

// MARK: - CaseIterable

extension AppAction: CaseIterable {
	
	/// Update continues for relevant tests
	static var allCases: [AppAction] {
		[
			.routeToCalc, .routeToLogin,
			.updatePassword(""), .updateUsername(""),
			.login("", ""), .logInButtonTapped, .setAccessToken(""), .loginProcess, .logout,
			.incrementCount, .decrementCount,
			.error(""), .cleanError
		]
	}
}
