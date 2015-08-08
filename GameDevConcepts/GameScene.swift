//
//  GameScene.swift
//  GameDevConcepts
//
//  Created by Gabriel Anderson on 8/7/15.
//  Copyright (c) 2015 Gabriel Anderson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var entities = [Entity]()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        /*let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
        
        //entities.append(Entity(x: 100, y: 100, color: SKColor.purpleColor()))
        //entities[entities.count-1].addParent(self)
        
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
        //let location = theEvent.locationInNode(self)
        
        //entities.append(Entity(x: location.x, y: location.y, color: SKColor.purpleColor()))
       // entities[entities.count-1].addParent(self)
        
        /*
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.position = location;
        sprite.setScale(0.5)
        
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(sprite)*/
    }
    
    override func mouseUp(theEvent: NSEvent) {
        let location = theEvent.locationInNode(self)
        
        entities.append(Entity(x: location.x, y: location.y, color: SKColor.purpleColor()))
        entities[entities.count-1].addParent(self)
        
        NSLog("Location: \(location.x), \(location.y)")
        //NSLog("Original Loc: \(entities[entities.count-1].body.x), \(entities[entities.count-1].body.y)")
        NSLog("Original Node Loc: \(entities[entities.count-1].body.shapeNode.position.x), \(entities[entities.count-1].body.shapeNode.position.y)")
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        var sign: Int
        var randomX: Float, randomY: Float
        for entity in entities {
            sign = arc4random_uniform(2) == 1 ? 1 : -1
            randomX = Float(sign * Int(arc4random_uniform(20)))
            randomY = Float(sign * Int(arc4random_uniform(20)))
            //NSLog("Random: \(random), \(currentTime)")
            entity.move(self, x: randomX, y: randomY)
        }
    }
}
