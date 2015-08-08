//
//  Triangle.swift
//  GameDevConcepts
//
//  Created by Gabriel Anderson on 8/7/15.
//  Copyright (c) 2015 Gabriel Anderson. All rights reserved.
//

import Cocoa
import SpriteKit

class Triangle: Shape {
    var width: CGFloat, height: CGFloat
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, borderColor: SKColor) {
        self.width = width
        self.height = height
        super.init(x: x, y: y, borderColor: borderColor)
        
    }
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, borderColor: SKColor, fillColor: SKColor){
        self.width = width
        self.height = height
        super.init(x: x, y: y, borderColor: borderColor, fillColor: fillColor)
        
        buildShape(borderColor,fillColor: fillColor)
        
    }
    
   /* convenience init(fillColor: SKColor) {
        self.init(x: 0.0, y: 0.0, width: 0.0, height: 0.0, borderColor: SKColor.windowBackgroundColor(), fillColor: fillColor)
        
    }*/

    private func buildShape(borderColor: SKColor) {
        /*CGPathMoveToPoint(path, nil, x + width, y)
        CGPathMoveToPoint(path, nil, x + width / 2, y+height)
        CGPathMoveToPoint(path, nil, x, y)*/
        
        let point1 = CGPoint(x: -width/2, y: -height/2)
        let point2 = CGPoint(x: +width/2, y: -height/2)
        let point3 = CGPoint(x: 0, y: +height/2)
        let points: [CGPoint] = [point1, point2, point3]//, point4]

        
        CGPathAddLines(path, nil, points, points.count)
        shapeNode.path = path
        shapeNode.strokeColor = borderColor
        shapeNode.lineWidth = 1.0
        //shapeNode.position.x = x
        //shapeNode.position.y = y
    }
    
    private func buildShape(borderColor: SKColor, fillColor: SKColor) {
        buildShape(borderColor)
        shapeNode.fillColor = fillColor
    }
    
}
