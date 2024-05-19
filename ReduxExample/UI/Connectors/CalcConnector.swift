//
//  CalcConnector.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import SwiftUI

struct CalcConnector: Connector {
	func map(state: ApplicationState, store: ApplicationStore) -> some View {
		CalcScene(
			count: state.calcForm.count,
			increment: {
				Task {
					await store.dispatch(action: .incrementCount)
				}
			},
			decrement: {
				Task {
					await store.dispatch(action: .decrementCount)
				}
			},
			logout: {
				Task { @MainActor in
					await store.dispatch(action: .logout)
				}
			}
		)
	}
}
