//
//  Middlewares.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 16.05.2024.
//

import AsyncRedux

// MARK: - LogMiddleware

struct LogMiddleware<Action>: Middleware {
	
	let logService: LogService
	
	func callAsFunction(action: Action) async -> Action? {
		logService.debug("Reduce \(action)")
		return action
	}
}

// MARK: - LoginMiddleware

struct LoginMiddleware: Middleware {
	
	let networkService: INetworkService
	
	func callAsFunction(action: AppAction) async -> AppAction? {
		if action == .logout {
			return .routeToLogin
		}
		
		guard case let .login(username, password) = action else {
			return action
		}
		
		do {
			if try await networkService.fetch(username, password) {
				return .routeToCalc
			}
		} catch {
			return .error(error.localizedDescription)
		}
		
		return action
	}
}
