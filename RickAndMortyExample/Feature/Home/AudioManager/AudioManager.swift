//
//  AudioManager.swift
//  RickAndMortyExample
//
//  Created by Tobi Adegoroye on 26/05/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

class AudioManager: UIViewController{
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func playMusic(fileName: String){
        do {
            if let fileURL = Bundle.main.path(forResource: fileName, ofType: "mp3") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                audioPlayer?.play()
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
    }
 
    func stopMusic(fileName: String){
        audioPlayer?.stop()
    }
}
