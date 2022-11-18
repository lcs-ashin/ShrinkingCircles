//
//  ContentView.swift
//  ShrinkingCircles
//
//  Created by Eunbi Shin on 2022-11-18.
//

import SwiftUI

struct ShrinkingCircles: Shape {
    func path(in rect: CGRect) -> Path {
        
        // Create the path
        var path = Path()
        
        
        
        // Return the path
        return path
    }
    
    
}

struct ContentView: View {
    var body: some View {
        ShrinkingCircles()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
