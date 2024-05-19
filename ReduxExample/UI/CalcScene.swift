//
//  CalcScene.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import SwiftUI

struct CalcScene: View {
	let count: Int
	
	let increment: Closure
	let decrement: Closure
	let logout: Closure
	
	var body: some View {
		ZStack(alignment: .topTrailing) {
			Color.clear
			VStack {
				HStack {
					Spacer()
					Button("Logout", action: logout)
				}
				Spacer()
				VStack {
					Text("The current count is \(count)")
					Button("Increment", action: increment)
					Button("Decrement", action: decrement)
				}
				Spacer()
			}
		}
		.padding()
	}
}

#Preview {
	CalcScene(
		count: 0,
		increment: {},
		decrement: {},
		logout: {}
	)
}
