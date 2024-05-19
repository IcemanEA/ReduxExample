//
//  DIContainer.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

enum DIMode {
	case executive
	case done
	case error(Error)
}

final class DIContainer {
	let networkService: INetworkService
	let logService: LogService
	
	init(_ mode: DIMode) {
		switch mode {
		case .executive:
			networkService = NetworkService()
		default:
			networkService = NetworkServiceMock(mode: mode)
		}
		
		logService = LogService(logLabel: "ReduxExample")
	}
}
