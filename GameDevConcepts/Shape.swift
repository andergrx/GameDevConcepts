//
//  Shape.swift
//  GameDevConcepts
//
//  Created by Gabriel Anderson on 8/7/15.
//  Copyright (c) 2015 Gabriel Anderson. All rights reserved.
//

import Cocoa
import SpriteKit

public class Shape {
    
    var borderColor: SKColor
    var fillColor: SKColor?
    
    var shapeNode: SKShapeNode = SKShapeNode()
    var path = CGPathCreateMutable()

    
    init(x: CGFloat, y: CGFloat, borderColor: SKColor) {
        shapeNode.position.x = x
        shapeNode.position.y = y
        self.borderColor = borderColor
    }
    
    init(x: CGFloat, y: CGFloat, borderColor: SKColor, fillColor: SKColor) {
        shapeNode.position.x = x
        shapeNode.position.y = y
        self.borderColor = borderColor
        self.fillColor = fillColor
    }

}
