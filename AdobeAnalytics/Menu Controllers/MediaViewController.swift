//
//  MediaViewController.swift
//  AdobeAnalytics
//
//  Created by Nick Porter on 6/9/18.
//  Copyright © 2018 Nick Porter. All rights reserved.
//

import UIKit
import AdobeMobileSDK
import MediaPlayer

class MediaViewController: UIViewController {

    let VIDEO_URL = "https://s7d2.scene7.com/is/content/mcmobile/new-building-AVS.m3u8"
    let MEDIA_NAME = "MyAdobe"
    let PLAYER_NAME = "MPMoviePlayer"
    let PLAYER_ID = "MPMoviePlayer1"
    let MEDIA_LENGTH = 146.0
    var movieController: MPMoviePlayerViewController!
    
    @IBOutlet weak var trackMilestonesSwitch: UISwitch!
    @IBOutlet weak var segmentMilestonesSwitch: UISwitch!
    @IBOutlet weak var trackOffsetMilestonesSwitch: UISwitch!
    @IBOutlet weak var segmentOffsetMilestonesSwitch: UISwitch!
    @IBOutlet weak var trackSecondsSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * Adobe Tracking - Analytics
         *
         * call to trackState:data: for view states report
         * trackState:data: increments the page view
         */
        ADBMobile.trackState("Media Example", data: nil)
        configureMedia()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func playMedia() {
        confgiureMediaTracking()
        self.present(movieController, animated: true, completion: nil)
        movieController.moviePlayer.play()
    }
    
    func configureMedia() {
        if let movieUrl = URL(string: VIDEO_URL) {
            movieController = MPMoviePlayerViewController(contentURL: movieUrl)
            configureNotifications(movieController.moviePlayer)
        }
    }
    
    // set up the notifications we are intereseted in for tracking
    func configureNotifications(_ moviePlayer: MPMoviePlayerController) {
        // this is where we will close our media item
        NotificationCenter.default.addObserver(self, selector: #selector(mediaFinishedCallback(_:)), name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: moviePlayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(mediaFinishedCallback(_:)), name: NSNotification.Name.MPMoviePlayerPlaybackStateDidChange, object: moviePlayer)
    }
    
    func confgiureMediaTracking() {
        let mediaSettings = ADBMobile.mediaCreateSettings(withName: MEDIA_NAME, length: MEDIA_LENGTH, playerName: PLAYER_NAME, playerID: PLAYER_ID)
        
        if trackMilestonesSwitch.isOn {
            /*
             * Adobe Tracking - Media
             *
             * sets the milestones that we would like to track on the ADBMediaSettings Object
             */
            mediaSettings.milestones = "25,50,75"
            if segmentMilestonesSwitch.isOn {
                /*
                 * Adobe Tracking - Media
                 *
                 * sets that we would like to segment by the milestones on the ADBMediaSettings Object
                 */
                mediaSettings.segmentByMilestones = true
            }
            
        } else if trackOffsetMilestonesSwitch.isOn {
            /*
             * Adobe Tracking - Media
             *
             * sets the offsetMilestones that we would like to track on the ADBMediaSettings Object
             */
            mediaSettings.offsetMilestones = "60,120"
            if segmentOffsetMilestonesSwitch.isOn {
                /*
                 * Adobe Tracking - Media
                 *
                 * sets that we would like to segment by the offsetMilestones on the ADBMediaSettings Object
                 */
                mediaSettings.segmentByOffsetMilestones = true
            }
        }
        
        /*
         * Adobe Tracking - Media
         *
         * opens the media item, preparing it for tracking
         */
        ADBMobile.mediaOpen(with: mediaSettings, callback: nil)
    }
    
    @objc func mediaFinishedCallback(_ notification: Notification) {
        /*
         * Adobe Tracking - Media
         *
         * closes the media item
         * media item should recieve no more calls unless its a new open and play
         */
        ADBMobile.mediaClose(MEDIA_NAME)
        
    }
    
    @objc func mediaPlaybackChangedCallback(_ notification: Notification) {
        
        guard let moviePlayer = notification.object as? MPMoviePlayerController else {
            return
        }
        
        if moviePlayer.playbackState == .playing {
            /*
             * Adobe Tracking - Media
             *
             * sets the media item into a playing state
             * if this is the initial play, it begins the tracking and monitor for the media item
             */
            
            ADBMobile.mediaPlay(MEDIA_NAME, offset: moviePlayer.currentPlaybackTime.isNaN ? 0.0 : moviePlayer.currentPlaybackTime)
        } else if moviePlayer.playbackState == .seekingBackward {
            /*
             * Adobe Tracking - Media
             *
             * stops the media item
             * we need to stop here because we are no longer in a playing state
             */
            
            ADBMobile.mediaStop(MEDIA_NAME, offset: moviePlayer.currentPlaybackTime)
        } else if moviePlayer.playbackState == .seekingForward {
            /*
             * Adobe Tracking - Media
             *
             * stops the media item
             * we need to stop here because we are no longer in a playing state
             */
            
            ADBMobile.mediaStop(MEDIA_NAME, offset: moviePlayer.currentPlaybackTime)
        } else if moviePlayer.playbackState == .paused {
            /*
             * Adobe Tracking - Media
             *
             * stops the media item
             * we need to stop here because we are no longer in a playing state
             */
            
            ADBMobile.mediaStop(MEDIA_NAME, offset: moviePlayer.currentPlaybackTime)
        } else if moviePlayer.playbackState == .interrupted {
            /*
             * Adobe Tracking - Media
             *
             * stops the media item
             * we need to stop here because we are no longer in a playing state
             */
            
            ADBMobile.mediaStop(MEDIA_NAME, offset: moviePlayer.currentPlaybackTime)
        } else if moviePlayer.playbackState == .stopped {
            /*
             * Adobe Tracking - Media
             *
             * stops the media item
             * we need to stop here because we are no longer in a playing state
             */
            
            ADBMobile.mediaStop(MEDIA_NAME, offset: moviePlayer.currentPlaybackTime)
        }
        
    }
    
}
