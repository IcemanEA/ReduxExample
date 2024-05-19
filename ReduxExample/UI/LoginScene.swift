//
//  LoginScene.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import SwiftUI

struct LoginScene: View {
	@Binding var username: String
	@Binding var password: String
	
	let isEnabled: Bool
	let isProgress: Bool
	let action: Closure
	
	var body: some View {
		VStack(spacing: 20) {
			Text("Welcome to Redux example")
				.font(.largeTitle)
				.fontWeight(.semibold)
				.multilineTextAlignment(.center)
				.padding(.top, 40)
			
			TextField("Enter username: 123", text: $username)
				.textFieldStyle(.roundedBorder)
				.padding(.horizontal)
			SecureField("Enter password: 123", text: $password)
				.textFieldStyle(.roundedBorder)
				.padding(.horizontal)
			
			if isProgress {
				ProgressView()
			} else {
				Button("Log in", action: action)
					.buttonStyle(.borderedProminent)
					.disabled(!isEnabled)
			}
			
			Spacer()
		}
		.ignoresSafeArea(.keyboard)
	}
}

#Preview {
	LoginScene(
		username: State(initialValue: "").projectedValue,
		password: State(initialValue: "").projectedValue,
		isEnabled: true,
		isProgress: false,
		action: {}
	)
}
