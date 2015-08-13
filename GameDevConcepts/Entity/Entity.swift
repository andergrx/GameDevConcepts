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
    case RotateSetup
    case Rotating
    case MoveSetup
    case Moving
    
    func toString() -> String {
        switch self {
        case RotateSetup:
            return "RotateSetup"
        case Rotating:
            return "Rotating"
        case MoveSetup:
            return "MoveSetup"
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
    
    var animationX: Float = 0.0
    var animationY: Float = 0.0
    
    var animationState = Animation.RotateSetup
    var hadAction: Bool = false
    
    let ACTION_DURATION = 0.9
    let ROTATE = 0.8
    
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
            
        case Animation.RotateSetup:
            animationX = x
            animationY = y
            
            incAngle = (atan2(y,x) - currentAngle) / (60 * Float(ROTATE))
            
            animationState = Animation.Rotating
            time = CFAbsoluteTimeGetCurrent()
            rotating(animationX,y: animationY)
        case Animation.Rotating:
            //rotating()
            
            if CFAbsoluteTimeGetCurrent() - time >= ROTATE {
                animationState = Animation.MoveSetup
            }
           // NSLog("\nnow: \(now), time: \(time)")
            
        case Animation.MoveSetup:
            move(scene, x: animationX, y: animationY)
            animationState = Animation.Moving
            time = CFAbsoluteTimeGetCurrent()
            
        case Animation.Moving:
            if CFAbsoluteTimeGetCurrent() - time >= ACTION_DURATION {
                animationState = Animation.RotateSetup
            }
            
        default:
            return
        }
        
        NSLog(animationState.toString())
    }
    
    func rotating(x: Float, y: Float) {
        let rotateAngle = atan2(y,x)
        let action = SKAction.rotateByAngle(CGFloat(rotateAngle-currentAngle), duration:0.9)
        body.shapeNode.runAction(action)
        //body.buildShape(currentAngle)
        currentAngle = rotateAngle
        
       // NSLog("rotationAngle: \(180 * rotationAngle / Float(M_PI))")
       // NSLog("incAngle: \(180 * incAngle / Float(M_PI)), currentAngle: \(180 * currentAngle / Float(M_PI))")
        
    }
    
    func move (scene: GameScene, x: Float, y: Float) {
        
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
        
        //NSLog("Body: \(body.x), \(body.y) || \(scene.size.width), \(scene.size.height)")
       // NSLog("Node \(self): \(body.shapeNode.position.x), \(body.shapeNode.position.y)")
    }


}
