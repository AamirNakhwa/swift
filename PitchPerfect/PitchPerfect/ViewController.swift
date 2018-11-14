//
//  ViewController.swift
//  PitchPerfect
//
//  Created by AamirNakhwa on 11/14/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblRecordingStatus.text = "Tap to record"
        stop.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBOutlet weak var lblRecordingStatus: UILabel!
    @IBAction func btnRecord(_ sender: Any) {
        lblRecordingStatus.text = "Recording in progress"
        stop.isEnabled = true
        record.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func btnStop(_ sender: Any) {
        stop.isEnabled = false
        lblRecordingStatus.text = "Recording Finished"
        record.isEnabled = true
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        //performSegue(withIdentifier: "Recording", sender: )
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag
        {
        performSegue(withIdentifier: "Recording", sender: audioRecorder.url)
        }
        else
        {
            print("Error in Recording...")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Recording"{
            let dest = segue.destination as! PlayViewController
            dest.recordedAudioURL = sender as! URL
        }
    }
}

