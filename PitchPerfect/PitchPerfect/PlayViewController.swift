//
//  PlayViewController.swift
//  PitchPerfect
//
//  Created by AamirNakhwa on 11/14/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {

    var recordedAudioURL:URL!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var stopButton: UIButton!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBOutlet weak var btnReverb: UIButton!
    @IBOutlet weak var btnEcho: UIButton!
    @IBOutlet weak var btnSlow: UIButton!
    @IBOutlet weak var btnFast: UIButton!
    @IBOutlet weak var btnLowPitch: UIButton!
    @IBOutlet weak var btnHighPitch: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PlaySoundForButton(_ sender: Any) {
        
        let btn = sender as! UIButton
        
        switch(ButtonType(rawValue:btn.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    @IBAction func StopSoundForButton(_ sender: Any) {
        stopAudio()
    }
    
}
