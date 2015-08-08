//
//  Entity.swift
//  GameDevConcepts
//
//  Created by Gabriel Anderson on 8/7/15.
//  Copyright (c) 2015 Gabriel Anderson. All rights reserved.
//

import Cocoa
import SpriteKit

public class Entity {
    let body: Triangle
    var boundingCircle: Circle
    var time: CFAbsoluteTime = 0
    
    let ACTION_DURATION = 0.2
    
    init(x: CGFloat, y: CGFloat, color: SKColor) {
        body = Triangle(x: x, y: y, width: 30, height: 50, borderColor: color, fillColor: color)
        boundingCircle = Circle(x: x, y: y, radius: 50, borderColor: SKColor.whiteColor())
    }
    
    func addParent(scene: GameScene) {
        scene.addChild(body.shapeNode)
        scene.addChild(boundingCircle.shapeNode)
    }
    
    func move (scene: GameScene, x: Float, y: Float) {
        let moveX = Float(Float(body.x) + x)
        let moveY = Float(Float(body.y) + y)
        
        if(CFAbsoluteTimeGetCurrent() - time < ACTION_DURATION) {
            return
        }
        
        if moveX > 50.0 && moveX <= Float(scene.size.width-50) {
        
            body.x = CGFloat(moveX)
            boundingCircle.x = CGFloat(moveX)
            
            let actionX = SKAction.moveToX(body.x, duration: ACTION_DURATION)
            body.shapeNode.runAction(actionX)
            boundingCircle.shapeNode.runAction(actionX)
        }
        
        if moveY > 50.0 && moveY <= Float(scene.size.height-50) {
                
            body.y = CGFloat(moveY)
            boundingCircle.y = CGFloat(moveY)
            
            let actionY = SKAction.moveToY(body.y, duration: ACTION_DURATION)
            body.shapeNode.runAction(actionY)
            boundingCircle.shapeNode.runAction(actionY)
        }
        
        time = CFAbsoluteTimeGetCurrent()
        NSLog("Body: \(body.x), \(body.y) || \(scene.size.width), \(scene.size.height)")
        NSLog("Node: \(body.shapeNode.position.x), \(body.shapeNode.position.y)")
    }

}
