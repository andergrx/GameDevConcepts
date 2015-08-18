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
    case Initiate
    case InProgress
    
    func toString() -> String {
        switch self {
        case Initiate:
            return "Initiate"
        case InProgress:
            return "InProgress"
        default:
            return ""
        }
    }
}

public class Entity {
    let body: Triangle
    var boundingCircle: Circle
    var currentAngle: Float = 0.0
    
    var animationX: Float = 0.0
    var animationY: Float = 0.0
    
    var animationState = Animation.Initiate
    
    var rotateAction: SKAction!
    var moveAction: SKAction?
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
            
        case Animation.Initiate:
            animationX = x
            animationY = y
            
            //incAngle = (atan2(y,x) - currentAngle) / (60 * Float(ROTATE))
            rotate(animationX, y: animationY)
            move(scene, x: animationX, y: animationY)

            if let mAction = moveAction {
                body.shapeNode.runAction(SKAction.sequence([rotateAction, mAction]))
                boundingCircle.shapeNode.runAction(SKAction.sequence([rotateAction, mAction]))
            } else {
                body.shapeNode.runAction(rotateAction)
            }
            
            animationState = Animation.InProgress

        case Animation.InProgress:
            if !body.shapeNode.hasActions() {
                animationState = Animation.Initiate
            }
            
        default:
            return
        }
        
        //NSLog(animationState.toString())
    }
    
    func rotate(x: Float, y: Float) {
        let rotateAngle = atan2(y,x)
        rotateAction = SKAction.rotateByAngle(CGFloat(rotateAngle-currentAngle), duration:0.9)
       
        currentAngle = rotateAngle
        
         //body.buildShape(currentAngle)
        
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
            moveAction = SKAction.moveTo(CGPoint(x: CGFloat(moveX),y: CGFloat(moveY)), duration: ACTION_DURATION)
        } else {
            moveAction = nil
        }
        
        //NSLog("Body: \(body.x), \(body.y) || \(scene.size.width), \(scene.size.height)")
       // NSLog("Node \(self): \(body.shapeNode.position.x), \(body.shapeNode.position.y)")
    }


}
