//
//  PrivacyViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/5/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit
import AdobeMobileSDK

class PrivacyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackState:data: for view states report
         * trackState:data: increments the page view
         */
        ADBMobile.trackState("Privacy Example", data: nil)
    }
    
    @IBAction func setPrivacyOptIn() {
        /*
         * Adobe Tracking - Analytics
         *
         * setting privacy status to ADBMobilePrivacyStatusOptIn will send hits immediately
         */
        ADBMobile.setPrivacyStatus(.optIn)
    }
    
    @IBAction func setPrivacyOptOut() {
        /*
         * Adobe Tracking - Analytics
         *
         * setting privacy status to ADBMobilePrivacyStatusOptOut will discard all hits immediately
         */
        ADBMobile.setPrivacyStatus(.optOut)
    }
    
    @IBAction func setPrivacyOptUnknown() {
        /*
         * Adobe Tracking - Analytics
         *
         * setting privacy status to ADBMobilePrivacyStatusOptUnknown will have different behaviors
         * if your app is not set to track offline, hits will be discarded immediately
         * if your app is set to track offline, hits will be retained until the privacy status changes
         * retained hits will all be sent if next privacy status is set to OptIn
         * retained hits will all be discarded if next privacy status is set to OptOut
         */
        ADBMobile.setPrivacyStatus(.unknown)
    }
    
    @IBAction func sendTrackAction() {
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackAction:data: for privacy status check
         * trackAction:data: does not increment page views
         */
        ADBMobile.trackAction("privacyStatusCheck", data: nil)
    }
    
}
