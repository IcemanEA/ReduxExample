//
//  AppDelegate.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 01.05.2024.
//

import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
	
	let di: DIContainer
	let store: ApplicationStore
	
	override convenience init() {
		self.init(mode: .executive)
	}
	
	init(mode: DIMode) {
		let di: DIContainer = .init(mode)
		
		self.di = di
		
		store = .init { state, action in
			state.reduce(action)
		} middleware: {
			LogMiddleware(logService: di.logService)
			LoginMiddleware(networkService: di.networkService)
		}
		
		super.init()
	}
	
	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
	) -> Bool {
		
		di.logService.debug("didFinishLaunchingWithOptions")
		
		return true
	}
}
