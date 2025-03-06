//
//  PurelyApp.swift
//  Purely
//
//  Created by فالحه الغنامي on 04/09/1446 AH.
//
import SwiftUI
import AVFoundation

struct ScanProductView: View {
    @StateObject private var scannerViewModel = ScannerViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScannerView(viewModel: scannerViewModel)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Text("Scan product")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text("Find a code to scan")
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    Spacer()
                    
                    Button(action: {
                        scannerViewModel.toggleFlash()
                    }) {
                        Image(systemName: scannerViewModel.isFlashOn ? "flashlight.on.fill" : "flashlight.off.fill")
                            .font(.title)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
    
    class ScannerViewModel: ObservableObject {
        @Published var isFlashOn = false
        private let captureSession = AVCaptureSession()
        
        func toggleFlash() {
            guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else { return }
            do {
                try device.lockForConfiguration()
                device.torchMode = isFlashOn ? .off : .on
                isFlashOn.toggle()
                device.unlockForConfiguration()
            } catch {
                print("Flash could not be used")
            }
        }
        
        func saveImage(_ image: UIImage) {
            let fileManager = FileManager.default
            let folderName = "ScannedProducts"
            
            if let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let folderURL = documentsURL.appendingPathComponent(folderName)
                
                if !fileManager.fileExists(atPath: folderURL.path) {
                    try? fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
                }
                
                let fileURL = folderURL.appendingPathComponent("\(UUID().uuidString).jpg")
                
                if let data = image.jpegData(compressionQuality: 0.8) {
                    try? data.write(to: fileURL)
                }
            }
        }
    }
    
    struct ScannerView: UIViewControllerRepresentable {
        var viewModel: ScannerViewModel
        
        func makeUIViewController(context: Context) -> ScannerViewController {
            return ScannerViewController(viewModel: viewModel)
        }
        
        func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}
    }
    
    class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
        private let viewModel: ScannerViewModel
        private let captureSession = AVCaptureSession()
        private var previewLayer: AVCaptureVideoPreviewLayer!
        
        init(viewModel: ScannerViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
            
            let videoInput: AVCaptureDeviceInput
            do {
                videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            } catch {
                return
            }
            
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            } else {
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            if captureSession.canAddOutput(metadataOutput) {
                captureSession.addOutput(metadataOutput)
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.ean13, .ean8, .qr]
            } else {
                return
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = view.layer.bounds
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)
            
            captureSession.startRunning()
        }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                if let stringValue = readableObject.stringValue {
                    print("Scanned code: \(stringValue)")
                    captureSession.stopRunning()
                }
            }
        }
    }
}
