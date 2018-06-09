//
//  InAppMessageViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/4/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

/*
 * Visit https://marketing.adobe.com/resources/help/en_US/mobile/in_app_messaging.html for more information about
 * in-app messaging.
 */

import UIKit
import AdobeMobileSDK

class InAppMessageViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackState:data: for view states report
         * trackState:data: increments the page view
         */
        ADBMobile.trackState("In-App Message Example", data: nil)
    }
    
    @IBAction func showFullScreenMessage() {
        /*
         * Adobe Tracking - Analytics
         *
         * triggering an in-app message on a custom state
         */
        ADBMobile.trackState("fullscreen example", data: nil)
    }
    
    @IBAction func showAlertMessage() {
        /*
         * Adobe Tracking - Analytics
         *
         * triggering an in-app message on a custom action
         */
        ADBMobile.trackAction("alert example", data: nil)
    }
    
    @IBAction func showLocalNotificationMessage() {
        /*
         * Adobe Tracking - Analytics
         *
         * triggering an in-app message on custom context data
         */
        ADBMobile.trackAction("local notification sample", data: ["local": "notification"])
    }
    
    @IBAction func showInteractiveMessage() {
        /*
         * Adobe Tracking - Analytics
         *
         * triggering an in-app message on custom context data
         */
        ADBMobile.trackAction("interactive local notification sample", data: ["Message_Type": "interactive_local_notification"])
    }
    
}
