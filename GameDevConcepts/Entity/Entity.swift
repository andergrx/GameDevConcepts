//
//  Entity.swift
//  GameDevConcepts
//
//  Created by Gabriel Anderson on 8/7/15.
//  Copyright (c) 2015 Gabriel Anderson. All rights reserved.
//

import Cocoa
import SpriteKit

enum Animation {
    case Initialize
    case Rotating
    case Moving
    
    func toString() -> String {
        switch self {
        case Initialize:
            return "Initialize"
        case Rotating:
            return "Rotating"
        case Moving:
            return "Moving"
        default:
            return ""
        }
    }
}

public class Entity {
    let body: Triangle
    var boundingCircle: Circle
    var time: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
    var currentAngle: Float = 0.0
    var rotationAngle: Float = 0.0
    var incAngle: Float = 0.0
    var rotateToAngle: Float = 0.0
    
    var animationX: Float = 0.0
    var animationY: Float = 0.0
    
    var animationState = Animation.Initialize
    var hadAction: Bool = false
    
    let ACTION_DURATION = 0.9
    let ROTATE: Float = 0.8
    
    init(x: CGFloat, y: CGFloat, color: SKColor) {
        body = Triangle(x: x, y: y, width: 30, height: 50, borderColor: color, fillColor: color)
        boundingCircle = Circle(x: x, y: y, radius: 50, borderColor: SKColor.whiteColor())
    }
    
    func addParent(scene: GameScene) {
        scene.addChild(body.shapeNode)
        scene.addChild(boundingCircle.shapeNode)
    }
    
    
    func animate(scene: GameScene, x: Float, y: Float) {
        
        switch animationState {
            
        case Animation.Initialize:
            rotating(x: x, y: y)
            animationState = Animation.Rotating
            
        case Animation.Rotating:
            if !rotating(x: x, y: y) {

                animationX = x
                animationY = y
                
                currentAngle = atan2(y,x)
            }
            
        case Animation.Moving:
            move(scene, x: animationX, y: animationY)
            animationState = Animation.Moving
            
        default:
            return
        }
        
        NSLog(animationState.toString())
    }
    
    func move (scene: GameScene, x: Float, y: Float) {
        
        if CFAbsoluteTimeGetCurrent() - time < ACTION_DURATION {
            return
        }

        if hadAction {
            animationState = Animation.Rotating
            hadAction == false
            return
        }
        
        var moveX: Float = body.shapeNode.position.x + x
        var moveY: Float = body.shapeNode.position.y + y
        
        if moveX <= 50.0 || moveX > scene.size.width-50 {
        
            moveX -= x
        }
        
        if moveY <= 50.0 || moveY > scene.size.height-50 {
            
            moveY -= y
        }
        
        if moveX != 0 && moveY != 0 {
            let action = SKAction.moveTo(CGPoint(x: CGFloat(moveX),y: CGFloat(moveY)), duration: ACTION_DURATION)
            body.shapeNode.runAction(action)
            boundingCircle.shapeNode.runAction(action)
            hadAction = true
        }
        
        time = CFAbsoluteTimeGetCurrent()
        
        //NSLog("Body: \(body.x), \(body.y) || \(scene.size.width), \(scene.size.height)")
        NSLog("Node \(self): \(body.shapeNode.position.x), \(body.shapeNode.position.y)")
    }
    
    func rotating(#x: Float, y: Float) -> Bool {
        
        if rotationAngle <= 0 {
            rotationAngle = atan2(y,x) - currentAngle
            incAngle = rotationAngle / (60 * ROTATE)
            rotateToAngle = currentAngle
        }
        
        body.buildShape(rotateToAngle)
        rotationAngle -= incAngle
        rotateToAngle += incAngle
        
        if rotationAngle <= 0 {
            animationState = Animation.Moving
            return false
        }

        NSLog("x,y: \(x,y), angle: \(180 * rotationAngle / Float(M_PI))")
        NSLog("incAngle: \(180 * incAngle / Float(M_PI)), rotateToAngle: \(180 * rotateToAngle / Float(M_PI))")
        
        return true
    }


}
