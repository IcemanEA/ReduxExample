//
//  NetworkService.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import Foundation

final class NetworkService: INetworkService {
	
	func fetch(_ username: String, _ password: String) async throws -> Bool {
		try await Task.sleep(nanoseconds: 2_000_000_000)
		
		if username == "123", password == "123" {
			return true
		}

		throw Error.badCredential
	}
}

// MARK: - Error

extension NetworkService {
	
	enum Error: Swift.Error, LocalizedError {
		case badCredential
		
		var errorDescription: String? {
			switch self {
			case .badCredential:
				"Incorrect login or password"
			}
		}
	}
}
