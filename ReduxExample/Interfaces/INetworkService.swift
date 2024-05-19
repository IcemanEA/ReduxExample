//
//  INetworkService.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 19.05.2024.
//

protocol INetworkService {
	func fetch(_ username: String, _ password: String) async throws -> Bool
}
