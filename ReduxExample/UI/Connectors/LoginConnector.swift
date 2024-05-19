//
//  LoginConnector.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import SwiftUI

struct LoginConnector: Connector {
	func map(state: ApplicationState, store: ApplicationStore) -> some View {
		LoginScene(
			username: Binding(
				get: { state.loginForm.username },
				set: { value in
					Task {
						await store.dispatch(action: .updateUsername(value))
					}
				}
			),
			password: Binding(
				get: { state.loginForm.password },
				set: { value in
					Task {
						await store.dispatch(action: .updatePassword(value))
					}
				}
			),
			isEnabled: state.loginForm.isEnabled,
			isProgress: state.loginForm.isProcess,
			action: {
				Task {
					await store.dispatch(action: .logInButtonTapped)
					await store.dispatch(
						action: .login(
							store.state.loginForm.username,
							store.state.loginForm.password
						)
					)
				}
			}
		)
	}
}
