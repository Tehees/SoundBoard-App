//
//  ViewController.swift
//  Soundboard App
//
//  Created by Stephen Lau on 2018-09-16.
//  Copyright © 2018 Stephen Lau. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let soundFileNames = ["chewy_roar","forcestrong","star-wars-theme-song","swvader03"]
    
    var audioPlayers = [AVAudioPlayer]()
    
    
    //setup audio plyers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for sound in soundFileNames {
            do {
                
                let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
                let audioPlayer = try AVAudioPlayer(contentsOf: url!)
                audioPlayers.append(audioPlayer)
            } catch {
                // Catch the error thrown
                audioPlayers.append(AVAudioPlayer())
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        //get the audio player that corresponds to one tapped
        
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
        
    }
    
}

