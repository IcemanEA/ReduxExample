//
//  Connector.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import SwiftUI

protocol Connector: View {
	associatedtype Content: View
	func map(state: ApplicationState, store: ApplicationStore) -> Content
}

extension Connector {
	var body: some View {
		Connected<Content>(map: map)
	}
}

fileprivate struct Connected<V: View>: View {
	@EnvironmentObject var store: ApplicationStore
	
	let map: (_ state: ApplicationState, _ store: ApplicationStore) -> V
	
	var body: V {
		map(store.state, store)
	}
}
