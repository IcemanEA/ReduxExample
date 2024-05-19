//
//  ReduxExampleApp.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 15.05.2024.
//

import SwiftUI

@main
struct ReduxExampleApp: App {
	
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
	var body: some Scene {
		WindowGroup {
			RouterConnector()
				.environmentObject(appDelegate.store)
		}
	}
}
