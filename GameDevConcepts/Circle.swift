//
//  Circle.swift
//  GameDevConcepts
//
//  Created by Gabriel Anderson on 8/7/15.
//  Copyright (c) 2015 Gabriel Anderson. All rights reserved.
//

import Cocoa
import SpriteKit

public class Circle: Shape {
    var radius: CGFloat
    
    init(x: CGFloat, y: CGFloat, radius: CGFloat, borderColor: SKColor){
        self.radius = radius
        //NSLog("radius: \(radius)")
        super.init(x: x, y: y, borderColor: borderColor)
        
        buildShape(borderColor)

    }
    
    init(x: CGFloat, y: CGFloat, radius: CGFloat, borderColor: SKColor, fillColor: SKColor){
        self.radius = radius
        super.init(x: x, y: y, borderColor: borderColor, fillColor: fillColor)
        
        buildShape(borderColor)
        
    }
    
    private func buildShape(borderColor: SKColor) {
        let path = CGPathCreateMutable()
        CGPathAddArc(path,nil,0,0,radius,CGFloat(0),CGFloat(M_PI*2),true)
        shapeNode.path = path
        shapeNode.strokeColor = borderColor
        shapeNode.lineWidth = 2.0
    }
}

/*
class Circle: NSView {
    var path: NSBezierPath
    var rect: NSRect
    
    init(rect: NSRect) {
        super.)
        self.rect = rect
        path = NSBezierPath(rect: self.rect)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
*/
