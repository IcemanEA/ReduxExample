//
//  RouterConnector.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import SwiftUI

struct RouterConnector: Connector {
	func map(state: ApplicationState, store: ApplicationStore) -> some View {
		RouterView(
			route: state.router,
			errorText: state.errorHandler.errorText,
			cleanError: {
				Task { @MainActor in
					await store.dispatch(action: .cleanError)
				}
			}
		)
	}
}
