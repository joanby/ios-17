//
//  DataScanner.swift
//  F34-ImToText
//
//  Created by Juan Gabriel Gomila Salas on 9/1/24.
//

import SwiftUI
import VisionKit

struct DataScanner: UIViewControllerRepresentable{
    
    @Binding var startScanning: Bool
    @Binding var scannedText: String
    
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let controller = DataScannerViewController(recognizedDataTypes: [.text()],
                                                   qualityLevel: .balanced,
                                                   isHighlightingEnabled: true)
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if self.startScanning {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        
        var parent : DataScanner
        
        init(_ parent: DataScanner){
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .text(let text):
                self.parent.scannedText = text.transcript
            default: break
            }
        }
        
    }
    
}
