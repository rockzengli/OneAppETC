//
//  OneAppETC.swift
//  OneAppETC
//
//  Created by Rock on 2020/7/23.
//

import Foundation

public protocol OneAppETCDelegate: class {
    func userInfo() -> [OneAppUserInfo: Any]
}

public class OneAppETC {

    public static let `default` = OneAppETC()

    /// 是否允许使用sdk
    private var isAllowAccess: Bool = false
    
    public weak var delegate: OneAppETCDelegate?

    /// 注册OneApp
    /// - Parameter key: 开发者与OneApp约定的appKey
    public func register(appKey key: String) {
        guard let appKey = OneAppConfiguration.OneAppAppKey(rawValue: key) else { return print("非法key") }
        #if DEBUG
            print("初始化SDK成功！")
        #endif
        isAllowAccess = OneAppConfiguration.allowAccess(appKey).value()
    }

    /// 获取用户手机号码
    public func phone() -> String {
        guard isAllowAccess, let phone = delegate?.userInfo()[.phone] as? String else {
            return ""
        }
        return phone
    }

    /// 获取用户userId
    public func userId() -> String {
        guard isAllowAccess, let userId = delegate?.userInfo()[.userId] as? String else {
            return ""
        }
        return userId
    }
}
