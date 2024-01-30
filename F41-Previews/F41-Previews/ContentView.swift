//
//  ContentView.swift
//  F41-Previews
//
//  Created by Juan Gabriel Gomila Salas on 25/1/24.
//

import SwiftUI

struct ContentView: View {
    
    var imageName = "globe"
    
    var body: some View {
        VStack {
            Image(systemName: self.imageName)
                .font(.title)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview("Portrait") {
    ContentView(imageName: "iphone")
}

#Preview("Landscape", traits: .landscapeLeft) {
    ContentView(imageName: "ipad")
}

#Preview("Size That Fits", traits: .sizeThatFitsLayout){
    ContentView(imageName: "applewatch")
}

#Preview("Fixed Layout", traits: .fixedLayout(width: 500, height: 250)){
    ContentView(imageName: "magicmouse")
}



#Preview("VC"){
    var vc = UIViewController()
    return vc
}


#Preview("From Storyboard"){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    var vc = storyboard.instantiateViewController(withIdentifier: "XXXViewController")
    
    return vc
}



struct ContentViewOld: PreviewProvider{
    static var previews: some View {
        Group{
            ContentView(imageName: "macbook")
                .previewDisplayName("Old 1")
            
            ContentView(imageName: "desktopcomputer")
                .previewDisplayName("Old 2")
        }
    }
}



