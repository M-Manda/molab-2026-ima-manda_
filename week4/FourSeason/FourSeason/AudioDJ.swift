//
//  AudioDJ.swift
//  FourSeason
//
//  Created by uurdmandakh munkhbayar on 2026.09.28.
//

import AVFoundation

@Observable
class AudioDJ {
    var soundIndex = 0
    var soundFile = audioRef[0]
    var player: AVAudioPlayer? = nil
    let fadeTime = 2.0
    
    // class must have initializer
    init() {
        print("AudioDJ init")
    }
    
    func play() {
        fadeOut(player) // googled how to fade out music
        player = loadAudio(soundFile)
        print("AudioDJ player", player as Any)
        // Loop indefinitely
        player?.numberOfLoops = -1
        player?.volume = 0
        player?.play()
        player?.setVolume(1, fadeDuration: fadeTime)
    }
    
    func stop() {
        fadeOut(player)
    }
    
    func fadeOut(_ oldPlayer: AVAudioPlayer?) {
        oldPlayer?.setVolume(0, fadeDuration: fadeTime)
        DispatchQueue.main.asyncAfter(deadline: .now() + fadeTime) {
            oldPlayer?.stop()
        }
    }
    
    func next() {
        choose(soundIndex+1)
    }
    
    func choose(_ index:Int) {
        soundIndex = (index) % AudioDJ.audioRef.count
        soundFile = AudioDJ.audioRef[soundIndex]
    }
    
    func loadAudio(_ str:String) -> AVAudioPlayer? {
        if (str.hasPrefix("https://")) {
            return loadUrlAudio(str)
        }
        return loadBundleAudio(str)
    }
    
    func loadUrlAudio(_ urlString:String) -> AVAudioPlayer? {
        let url = URL(string: urlString)
        do {
            let data = try Data(contentsOf: url!)
            return try AVAudioPlayer(data: data)
        } catch {
            print("loadUrlSound error", error)
        }
        return nil
    }
    
    func loadBundleAudio(_ fileName:String) -> AVAudioPlayer? {
        let path = Bundle.main.path(forResource: fileName, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            return try AVAudioPlayer(contentsOf: url)
        } catch {
            print("loadBundleAudio error", error)
        }
        return nil
    }
    
    static let audioRef = [
        "spring.mp3",
        "summer.mp3",
        "autumn.mp3",
        "winter.mp3",
    ]
//    Dowloaded audios from https://www.classicals.de/vivaldi-seasons
    
}
