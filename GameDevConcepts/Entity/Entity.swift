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
    var time: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
    
    let ACTION_DURATION = 2.0
    
    init(x: CGFloat, y: CGFloat, color: SKColor) {
        body = Triangle(x: x, y: y, width: 30, height: 50, borderColor: color, fillColor: color)
        boundingCircle = Circle(x: x, y: y, radius: 50, borderColor: SKColor.whiteColor())
    }
    
    func addParent(scene: GameScene) {
        scene.addChild(body.shapeNode)
        scene.addChild(boundingCircle.shapeNode)
    }
    
    func move (scene: GameScene, x: Float, y: Float) {
        var moveX: Float = Float(Float(body.shapeNode.position.x) + x)
        var moveY: Float = Float(Float(body.shapeNode.position.y) + y)
        
        if(CFAbsoluteTimeGetCurrent() - time < ACTION_DURATION) {
            return
        }
        
        updateBody(x, y: y)
        
        if moveX <= 50.0 || moveX > Float(scene.size.width-50) {
        
            //body.shapeNode.position.x = CGFloat(moveX)
            //boundingCircle.shapeNode.position.x = CGFloat(moveX)
            moveX = 0
            
            //let actionX = SKAction.moveToX(CGFloat(moveX), duration: ACTION_DURATION)
            //body.shapeNode.runAction(actionX)
            //boundingCircle.shapeNode.runAction(actionX)
        }
        
        if moveY <= 50.0 || moveY > Float(scene.size.height-50) {
                
            //body.shapeNode.position.y = CGFloat(moveY)
            //boundingCircle.shapeNode.position.y = CGFloat(moveY)
            moveY = 0
            
            //let actionY = SKAction.moveToY(CGFloat(moveY), duration: ACTION_DURATION)
            //body.shapeNode.runAction(actionY)
            //boundingCircle.shapeNode.runAction(actionY)
        }
        
        NSLog("mx,my: \(moveX,moveY)")
        if moveX != 0 && moveY != 0 {
            let action = SKAction.moveTo(CGPoint(x: CGFloat(moveX),y: CGFloat(moveY)), duration: ACTION_DURATION)
            body.shapeNode.runAction(action)
            boundingCircle.shapeNode.runAction(action)
        }
        
        time = CFAbsoluteTimeGetCurrent()
        
        //NSLog("Body: \(body.x), \(body.y) || \(scene.size.width), \(scene.size.height)")
        //NSLog("Node \(self): \(body.shapeNode.position.x), \(body.shapeNode.position.y)")
    }
    
    func updateBody(x: Float, y: Float) {
        let angle: Float = atan2(y,x)
        body.buildShape(angle)

        NSLog("x,y: \(x,y), angle: \(180 * angle / Float(M_PI))")
        
    }

}
