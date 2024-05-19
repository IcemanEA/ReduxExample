//
//  AppState.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 16.05.2024.
//

import AsyncRedux

struct ApplicationState: State {
	var router: AppRouter = .init()
	var loginForm: LoginForm = .init()
	var calcForm: CalcForm = .init()
	var errorHandler: ErrorHandler = .init()
	
	mutating func reduce(_ action: AppAction) {
		loginForm.reduce(action)
		calcForm.reduce(action)
		router.reduce(action)
		errorHandler.reduce(action)
	}
	
	init() {}
}

// MARK: - AppRouter

enum AppRouter: State {
	case login
	case calc
	
	init() { self = .login }
	
	mutating func reduce(_ action: AppAction) {
		switch action {
		case .routeToLogin:
			self = .login
		case .routeToCalc:
			self = .calc
			
		default:
			break
		}
	}
}

// MARK: - LoginForm

struct LoginForm: State {
	var username: String = ""
	var password: String = ""
	var isProcess: Bool = false
	
	var isEnabled: Bool {
		username.count > 2 && password.count > 2
	}
	
	init() {}
	
	mutating func reduce(_ action: AppAction) {
		switch action {
		case .updateUsername(let value):
			username = value
		case .updatePassword(let value):
			password = value
		case .logInButtonTapped:
			isProcess = true
		case .error(_):
			isProcess = false
		case .routeToLogin:
			let lastUsername = username
			self = LoginForm()
			username = lastUsername
			
		default: break
		}
	}
}

// MARK: - CalcForm

struct CalcForm: State {
	var count: Int = 0
	
	init() {}
	
	mutating func reduce(_ action: AppAction) {
		switch action {
		case .incrementCount:
			count += 1
		case .decrementCount:
			count -= 1
		
		default: break
		}
	}
}

// MARK: - ErrorHandler

struct ErrorHandler: State {
	var errorText: String = ""
	
	init() {}
	
	mutating func reduce(_ action: AppAction) {
		switch action {
		case .error(let value):
			errorText = value
		case .cleanError:
			errorText.removeAll()
		
		default: break
		}
	}
}
