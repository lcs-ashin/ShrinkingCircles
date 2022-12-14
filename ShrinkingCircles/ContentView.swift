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
        
        // First circle, largest
        path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX - rect.height / 2, y: 0),
                                   size: CGSize(width: rect.height,
                                                height: rect.height)))
        
        // Second circle
        path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX - rect.height * 0.9 / 2,
                                                   y: rect.height * 0.05),
                                   size: CGSize(width: rect.height * 0.9,
                                                height: rect.height * 0.9)))
        
        
        // Return the path
        return path
    }
    
    
}

struct ShrinkingCirclesIteration: Shape {
    func path(in rect: CGRect) -> Path {
        
        // Create the path
        var path = Path()
        
        // Create circles
        for i in 0...9 {
            
            let ratio = 0.1 * Double(i)
            let ratioTwo = 1 - ratio
            
            path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX - rect.height * ratioTwo / 2,
                                                       y: rect.height * (ratio / 2)),
                                       size: CGSize(width: rect.height * ratioTwo,
                                                    height: rect.height * ratioTwo)))
        }
        
        
        
        // Return the path
        return path
    }
    
    
}

struct ShrinkingCirclesRecursion: Shape {
    
    // MARK: Stored Property
    let desiredDepth: Int
    
    // MARK: Functions
    func path(in rect: CGRect) -> Path {
        // Create the path
        var path = Path()
        
        // Begin calling the recursive helper
        let allThePaths = recursiveHelper(currentDepth: 1, drawingIn: rect)
        path.addPath(allThePaths)
        
        // Return the path
        return path
    }
    
    func recursiveHelper(currentDepth: Int,
                         drawingIn rect: CGRect) -> Path {
        
        // Make the path
        var path = Path()
        
        // Draw the circle for the current depth
        let ratio = 0.1 * Double(currentDepth - 1)
        let ratioTwo = 1 - ratio
        
        path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX - rect.height * ratioTwo / 2,
                                                   y: rect.height * (ratio / 2)),
                                   size: CGSize(width: rect.height * ratioTwo,
                                                height: rect.height * ratioTwo)))
        
        // Decide whether to call the function again (recurse)
        if currentDepth < desiredDepth {
            let pathForNextCircle = recursiveHelper(currentDepth: currentDepth + 1, drawingIn: rect)
            path.addPath(pathForNextCircle)
        }
        
        // Return the path
        return path
    }
    
}

struct ContentView: View {
    var body: some View {
        VStack {
            ShrinkingCirclesIteration()
                .stroke(lineWidth: 3)
            
            ShrinkingCirclesRecursion(desiredDepth: 10)
                .stroke(lineWidth: 3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
