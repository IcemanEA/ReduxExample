//
//  RouterView.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 15.05.2024.
//

import SwiftUI

struct RouterView: View {
	
	let route: AppRouter
	let errorText: String
	let cleanError: Closure
	
	@State var isError: Bool = false
	
	var body: some View {
		ZStack {
			switch route {
			case .login:
				LoginConnector()
			case .calc:
				CalcConnector()
			}
		}
		.onChange(of: errorText) { newValue in
			isError = !newValue.isEmpty
		}
		.onChange(of: isError) { newValue in
			if newValue == false {
				cleanError()
			}
		}
		.alert(errorText, isPresented: $isError) {
			Button("OK", role: .cancel) { }
		}
	}
}

#Preview {
	RouterView(
		route: .login,
		errorText: "",
		cleanError: {},
		isError: false
	).environmentObject(AppDelegate(mode: .done).store)
}
