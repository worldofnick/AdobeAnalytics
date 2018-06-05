//
//  SimpleTrackingViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/4/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit
import AdobeMobileSDK

class SimpleTrackingViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!

    @IBAction func trackStateTapped() {
        var contextData = [String: Any]()
        if let username = usernameTextField.text {
            contextData["user.name"] = username
        }
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackState:data: for view states report
         * trackState:data: increments the page view
         */
        ADBMobile.trackState("Example State", data: contextData)
    }
    
    @IBAction func trackActionTapped() {
        var contextData = [String: Any]()
        contextData["page.name"] = "Example State"
        if let username = usernameTextField.text {
            contextData["user.name"] = username
        }
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackAction:data: indicating the trackAction button was pushed
         * trackAction:data: does not increment page view
         * actions are often mapped to events via processing rules
         */
        ADBMobile.trackAction("trackAction:data: button pushed", data: contextData)
    }
    
}
