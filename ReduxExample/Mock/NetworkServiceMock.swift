//
//  NetworkServiceMock.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 19.05.2024.
//

final class NetworkServiceMock: INetworkService {
	
	let mode: DIMode
	
	init (mode: DIMode = .done) {
		self.mode = mode
	}
	
	func fetch(_ username: String, _ password: String) async throws -> Bool {
		switch mode {
		case .executive:
			break
		case .done:
			return true
		case .error(let error):
			throw error
		}
		
		return true
	}
}
