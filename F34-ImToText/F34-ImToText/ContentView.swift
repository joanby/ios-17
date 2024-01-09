//
//  ContentView.swift
//  F34-ImToText
//
//  Created by Juan Gabriel Gomila Salas on 9/1/24.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    
    @State private var startScanning = false
    @State private var scannedText = ""
    
    var body: some View {
        VStack {
            DataScanner(startScanning: self.$startScanning,
                        scannedText: self.$scannedText)
            .frame(height: 450)
            
            Text(self.scannedText)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .background(in: Rectangle())
                .backgroundStyle(Color.teal.opacity(0.2))
        }
        .padding()
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                self.startScanning.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
