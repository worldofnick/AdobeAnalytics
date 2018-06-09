//
//  TimeActionViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/9/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit
import AdobeMobileSDK

class TimeActionViewController: UIViewController {
    
    @IBOutlet weak var inAppTimeLabel1: UILabel!
    @IBOutlet weak var totalTimeLabel1: UILabel!
    @IBOutlet weak var inAppTimeLabel2: UILabel!
    @IBOutlet weak var totalTimeLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         * Adobe Tracking - Analytics
         *
         * call to trackState:data: for view states report
         * trackState:data: increments the page view
         */
        ADBMobile.trackState("Timed Action Example", data: nil)
    }

    @IBAction func startAction1() {
        /*
         * Adobe Tracking - Analytics
         *
         * start a timed action with name "action1" and no additional context data
         * note: if you call trackTimedActionStart:data: for an action already running, it will overwrite the existing one
         */
        ADBMobile.trackTimedActionStart("action1", data: nil)
    }
    
    @IBAction func stopAction1() {
        ADBMobile.trackTimedActionEnd("action1") { (inAppDuration, totalDuration, data) -> Bool in
            DispatchQueue.main.async {
                self.updateLabels(self.inAppTimeLabel1, totalLabel: self.totalTimeLabel1, inAppDuration: inAppDuration, totalDuration: totalDuration)
            }
            return true
        }
    }
    
    @IBAction func startAction2() {
        /*
         * Adobe Tracking - Analytics
         *
         * start a timed action with name "action2" and no additional context data
         * note: if you call trackTimedActionStart:data: for an action already running, it will overwrite the existing one
         */
        ADBMobile.trackTimedActionStart("action2", data: nil)
    }
    
    @IBAction func stopAction2() {
        ADBMobile.trackTimedActionEnd("action1") { (inAppDuration, totalDuration, data) -> Bool in
            DispatchQueue.main.async {
                self.updateLabels(self.inAppTimeLabel2, totalLabel: self.totalTimeLabel2, inAppDuration: inAppDuration, totalDuration: totalDuration)
            }
            return true
        }
    }
    
    func updateLabels(_ inAppLabel: UILabel, totalLabel: UILabel, inAppDuration: TimeInterval, totalDuration: TimeInterval) {
        inAppLabel.text = String(format: "In-app Time: %.0f second(s)", inAppDuration)
        totalLabel.text = String(format: "Total Time: %.0f second(s)", totalDuration)
    }
    
}
