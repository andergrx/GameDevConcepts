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
    //var angle: Float
    
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
        
        let point1 = CGPoint(x: -height/2, y: -width/2)
        let point2 = CGPoint(x: -height/2, y: +width/2)
        let point3 = CGPoint(x: height/2, y: 0)
        let points: [CGPoint] = [point1, point2, point3]//, point4]

        let path = CGPathCreateMutable()
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
    
    func buildShape(angle: Float) {
        
        let m1: Float = cos(angle)
        let m2: Float = -sin(angle)
        let m3: Float = sin(angle)
        //let rotationMatrix: [Float] = [m1, m2, m3, m1]
        
        var xp = [Float](count: 3, repeatedValue: 0.0)
        var yp = [Float](count: 3, repeatedValue: 0.0)
        
        xp[0] = Float(-height)/2 * m1 + Float(-width)/2 * m2
        yp[0] = Float(-height)/2 * m3 + Float(-width)/2 * m1
        
        xp[1] = Float(-height)/2 * m1 + Float(width)/2 * m2
        yp[1] = Float(-height)/2 * m3 + Float(width)/2 * m1

        xp[2] = Float(height)/2 * m1
        yp[2] = Float(height)/2 * m3
        
        let point1 = CGPoint(x: CGFloat(xp[0]), y: CGFloat(yp[0]))
        let point2 = CGPoint(x: CGFloat(xp[1]), y: CGFloat(yp[1]))
        let point3 = CGPoint(x: CGFloat(xp[2]), y: CGFloat(yp[2]))
        let points: [CGPoint] = [point1, point2, point3]//, point4]
        
        let path = CGPathCreateMutable()
        CGPathAddLines(path, nil, points, points.count)
        shapeNode.path = path
        shapeNode.strokeColor = borderColor
        shapeNode.lineWidth = 1.0
        
        //NSLog("Angle: \(angle), x1,y1: \(xp[0]),\(yp[0]), x2,y2: \(xp[1]),\(yp[1]), x3,y3: \(xp[2]),\(yp[2])")
        
    }
}
