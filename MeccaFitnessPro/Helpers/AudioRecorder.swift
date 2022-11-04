//
//  AudioRecorder.swift
//  MeccaFitness
//
//  Created by CodeCue Solutions on 21/10/2022.
//

import Foundation
import AVFoundation

class AudioRecorder :  ObservableObject  {

    var audioRecorder : AVAudioRecorder!
    @Published var isRecording : Bool = false
    @Published var recordedTime = 0
    @Published var timer : Timer?
    @Published var recordedTimeString : String = "00:00"
    @Published var recordedFileUrl : URL? = nil
    @Published var fileRandomId : String? = nil

    
    func startRecording(){
        self.fileRandomId = UUID().uuidString
        let fileName = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("audio_\(self.fileRandomId ?? "file_id").mp4")
        self.recordedFileUrl = fileName
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
            audioRecorder.prepareToRecord()
            audioRecorder.record()
            isRecording = true
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (value) in
                           self.recordedTime += 1
                           self.recordedTimeString = self.covertSecToMinAndHour(seconds: self.recordedTime)
                       })
        } catch {
            print("Failed to Setup the Recording")
        }
    }

    func stopRecording(){
        if audioRecorder != nil{
            audioRecorder!.stop()
        }
        if self.timer != nil{
            self.timer!.invalidate()
        }
        self.timer = nil
        self.recordedTime = 0
        self.recordedTimeString = "00:00"
        isRecording = false
    }

    func deleteRecording(){
        self.stopRecording()
        if self.audioRecorder != nil{
            self.audioRecorder!.deleteRecording()
        }
        self.recordedFileUrl = nil
        self.fileRandomId = nil
    }
    
    private func covertSecToMinAndHour(seconds : Int) -> String{
        let (_,m,s) = (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        let sec : String = s < 10 ? "0\(s)" : "\(s)"
        return "\(m):\(sec)"
    }

}
