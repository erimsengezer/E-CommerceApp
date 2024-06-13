//
//  Logger.swift
//  E-CommerceApp
//
//  Created by erimsengezer on 13.06.2024.
//

import Foundation

import Foundation

internal enum LogLevel: String {
    case info = "ℹ️"
    case warning = "⚠️"
    case error = "❌"
    case critical = "🔥"
}

enum Logger {
    fileprivate static let dateFormat = "hh:mm:ss.SSS"
    fileprivate static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }

    static func log(_ message: String, level: LogLevel = .info, fileName: String = #file, line: Int = #line, funcName: String = #function) {
        #if DEBUG
            print("(Logger) \(Date().timeStamp()) \(level.rawValue) \(sourceFileName(filePath: fileName)):\(line) \(funcName) -> \(message)")
        #endif
    }

    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last ?? ""
    }
}

internal extension Date {
    func timeStamp() -> String {
        return Logger.dateFormatter.string(from: self as Date)
    }
}
