//
//  LocationTargetingViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/5/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit
import CoreLocation
import AdobeMobileSDK

class LocationTargetingViewController: UIViewController {

    let seattle = CLLocation(latitude: 47.60621, longitude: -122.33207)
    let sanJose = CLLocation(latitude: 37.33939, longitude: -121.89496)
    let nyc = CLLocation(latitude: 40.71435, longitude: -74.00597)
    let dallas = CLLocation(latitude: 32.78014, longitude: -96.80045)
    let miami = CLLocation(latitude: 25.78897, longitude: -80.22644)
    
    @IBOutlet var locationButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackState:data: for view states report
         * trackState:data: increments the page view
         */
        ADBMobile.trackState("Location Targeting Example", data: nil)
    }
    
    func sendLocationTrack(_ location: CLLocation) {
        /* Adobe Tracking - Analytics
         *
         * standard tracking location call with our pre-determined CLLocation objects
         * once we have a location via trackLocation:data, the poi data will automatically be used
         * for subsequent calls to target
         */
        ADBMobile.trackLocation(location, data: nil)
        
        runLocationTargeting()
    }
    
    func runLocationTargeting() {
        /* Adobe Tracking - Target
         *
         * reset cookies to ensure target gives us a different experience depending on user's location choice
         * note: we are resetting cookies for this demo so the target server will allow us to reset experiences
         */
        ADBMobile.targetClearCookies()
        
        /* Adobe Tracking - Target
         *
         * create a request for the geo targeting location
         * default is black background and white text
         */
        let locationRequest = ADBMobile.targetCreateRequest(withName: "geoColors", defaultContent: "ffffff/000000", parameters: nil)
        
        /* Adobe Tracking - Target
         *
         * send our location request and in the callback, change the colors we get back from target
         */
        ADBMobile.targetLoad(locationRequest) { (content) in
            guard let colors = content?.components(separatedBy: "/"), colors.count == 2 else {
                return
            }

            self.performSelector(onMainThread: #selector(self.updateButtonTint(_:)), with: UIColor(hexString: colors[0]), waitUntilDone: false)
        }
    }
    
    @objc func updateButtonTint(_ color: UIColor) {
        for button in locationButtons {
            button.tintColor = color
        }
    }
    
    @IBAction func sendSeattle() {
        sendLocationTrack(seattle)
    }
    
    @IBAction func sendSanJose() {
        sendLocationTrack(sanJose)
    }
    
    @IBAction func sendNYC() {
        sendLocationTrack(nyc)
    }
    
    @IBAction func sendDallas() {
        sendLocationTrack(dallas)
    }
    
    @IBAction func sendMiami() {
        sendLocationTrack(miami)
    }
    
    
}
