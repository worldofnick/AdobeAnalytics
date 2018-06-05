//
//  AppDelegate.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 5/25/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit
import AdobeMobileSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ADBMobile.overrideConfigPath(Bundle.main.path(forResource: "ADBMobileConfig", ofType: "json"))
        ADBMobile.setDebugLogging(true)
        ADBMobile.collectLifecycleData()
        
        return true
    }
}
