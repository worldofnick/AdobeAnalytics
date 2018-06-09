//
//  LifetimeValueViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/9/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit
import AdobeMobileSDK

class LifetimeValueViewController: UIViewController {

    @IBOutlet weak var lifetimeValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackState:data: for view states report
         * trackState:data: increments the page view
         */
        ADBMobile.trackState("Lifetime Value", data: nil)
    }

    @IBAction func linkClicked() {
        let data = ["Success Event": "Link Clicked"]
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackLifetimeValueIncrease:data: to increase user's lifetime value
         * we are attributing clicking a link to a value of 3.5
         */
        ADBMobile.trackLifetimeValueIncrease(NSDecimalNumber(string: "3.5"), data: data)
        
        self.updateLifetimeValueLabel()
    }
    
    @IBAction func purchaseMade() {
        let data = ["Success Event": "Purchase"]
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackLifetimeValueIncrease:data: to increase user's lifetime value
         * we are attributing a purchase to a value of 10.0
         */
        ADBMobile.trackLifetimeValueIncrease(NSDecimalNumber(string: "10.0"), data: data)
        
        self.updateLifetimeValueLabel()
    }
    
    @IBAction func mediaUploaded() {
        let data = ["Success Event": "Media Uploaded"]
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackLifetimeValueIncrease:data: to increase user's lifetime value
         * we are attributing uploading media to a value of 5.0
         */
        ADBMobile.trackLifetimeValueIncrease(NSDecimalNumber(string: "5.0"), data: data)
        
        self.updateLifetimeValueLabel()
    }
    
    @IBAction func mediaViewed() {
        let data = ["Success Event": "Media Viewed"]
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackLifetimeValueIncrease:data: to increase user's lifetime value
         * we are attributing viewing media to a value of 7.0
         */
        ADBMobile.trackLifetimeValueIncrease(NSDecimalNumber(string: "7.0"), data: data)
        
        self.updateLifetimeValueLabel()
    }
    
    @IBAction func socialEngagement() {
        let data = ["Success Event": "Social Engagement"]
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackLifetimeValueIncrease:data: to increase user's lifetime value
         * we are attributing a social engagement to a value of 9.0
         */
        ADBMobile.trackLifetimeValueIncrease(NSDecimalNumber(string: "9.0"), data: data)
        
        self.updateLifetimeValueLabel()
    }
    
    func updateLifetimeValueLabel() {
        lifetimeValueLabel.text = "Lifetime Value: \(String(describing: ADBMobile.lifetimeValue()))"
    }
}
