//
//  ViewController.swift
//  OneAppETC
//
//  Created by zengli on 07/23/2020.
//  Copyright (c) 2020 zengli. All rights reserved.
//

import UIKit
import OneAppETC

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //注册sdk
        OneAppETC.default.register(appKey: "jiuyv")
        OneAppETC.default.delegate = self
        let phone = OneAppETC.default.phone()
        let userId = OneAppETC.default.userId()
        
        //获取字体沙盒路径
        let fontUrl = OneAppETC.default.fontUrlInSandbox(fontName: .hyQiHei60)

        //打印手机号码和userID
        print("phone: \(phone) \nuserId: \(userId) \nfontUrl: \(fontUrl?.absoluteString)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: OneAppETCDelegate {
    
    func userInfo() -> [OneAppUserInfo : Any] {
        return [.phone: "18626348698",
                .userId: "1111111111"]
    }
    
    /// 自定义字体沙盒路径
    func fontUrlInSandbox(fontName: OneAppFontFamilyName) -> URL? {
        return nil
    }
}
