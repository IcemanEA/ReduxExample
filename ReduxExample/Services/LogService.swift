//
//  NetworkService.swift
//  ReduxExample
//
//  Created by Egor Ledkov on 17.05.2024.
//

import Foundation
import os.log

final class LogService {
	private let osLog: OSLog
	
	init(logLabel: String) {
		self.osLog = OSLog(subsystem: "app", category: logLabel)
	}
	
	func debug(_ message: String) {
#if DEBUG
		self.log(message: message, level: .error)
#else
		self.log(message: message, level: .debug)
#endif
	}
	
	func info(_ message: String) {
		self.log(message: message, level: .info)
	}
	
	func error(_ message: String) {
		self.log(message: message, level: .error)
	}
	
	func fault(_ message: String) {
		self.log(message: message, level: .fault)
	}
	
	private func log(message: String, level: OSLogType) {
		let queue = String(cString: __dispatch_queue_get_label(nil), encoding: .utf8) ?? ""
		let logMessage = "[\(queue)] \(message)"
	
#if DEBUG
		os_log("%{public}@", log: self.osLog, type: level, logMessage)
#endif
	}
}
