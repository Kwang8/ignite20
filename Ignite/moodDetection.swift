//
//  moodDetection.swift
//  Ignite
//
//  Created by Kevin on 6/15/19.
//  Copyright © 2019 Kevin. All rights reserved.
//

import Foundation
import CoreML
import Vision
import AVKit
import UIKit
class moodDetection: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var predictedActivity = ""
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 160, y: 562, width: 100, height: 100))
        button.setImage(UIImage(named: "camera"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        guard let device = AVCaptureDevice.devices().filter({ $0.position == .front })
            .first as? AVCaptureDevice else {
                fatalError("No front facing camera found")
        }
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        captureSession.addInput(input)
        
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        view.addSubview(button)
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        
        
        
    
    }
    @objc func buttonAction(sender: UIButton!) {
        UserDefaults.standard.set(predictedActivity, forKey: "mood")
        
        performSegue(withIdentifier: "toMoodResults", sender: nil)
    }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        guard let model = try? VNCoreMLModel(for: CNNEmotions().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
           
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            DispatchQueue.main.async {
                self.predictedActivity = firstObservation.identifier
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
    
}
