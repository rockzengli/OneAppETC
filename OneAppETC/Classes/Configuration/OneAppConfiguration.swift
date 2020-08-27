//
//  OneAppConfiguration.swift
//  OneAppETC
//
//  Created by Rock on 2020/7/23.
//

import Foundation

/// 对外开放的appKey
enum OneAppConfiguration {
    enum OneAppAppKey: String {
        case jiuyv = "jiuyv"
        case unknown = "unknown"
    }

    case allowAccess(_ key: OneAppAppKey)
    func value() -> Bool {
        switch self {
        case .allowAccess(let key):
            switch key {
            case .jiuyv:
                return true
            default:
                return false
            }
        }
    }
}

public enum OneAppUserInfo: String {
    case userId
    case phone
}
