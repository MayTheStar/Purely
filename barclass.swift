//
//  barclass.swift
//  barcode
//
//  Created by Diala Abdulnasser Fayoumi on 21/08/1446 AH.
//
import UIKit
import AVFoundation
import Vision

class barclass: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCamera()
    }
    
    func setupCamera() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .high
        
        guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("No camera found")
            return
        }
        
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            } else {
                print("Failed to add camera input")
                return
            }
        } catch {
            print("Camera input error: \(error)")
            return
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        } else {
            print("Failed to add camera output")
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        let request = VNDetectBarcodesRequest { (request, error) in
            guard error == nil else {
                print("Barcode detection error: \(error!.localizedDescription)")
                return
            }
            
            if let results = request.results as? [VNBarcodeObservation] {
                for barcode in results {
                    if let payload = barcode.payloadStringValue {
                        DispatchQueue.main.async {
                            self.captureSession.stopRunning()
                            self.showBarcodeResult(payload)
                        }
                    }
                }
            }
        }
        
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                print("Failed to perform barcode detection: \(error)")
            }
        }
    }
    
    func showBarcodeResult(_ code: String) {
        let alert = UIAlertController(title: "Barcode Detected", message: code, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.captureSession.startRunning()
        })
        present(alert, animated: true)
    }
}
