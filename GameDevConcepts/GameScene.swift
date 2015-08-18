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
    var entityIndex: Int = 0;
    var image: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        /*let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
        
        //entities.append(Entity(x: 100, y: 100, color: SKColor.purpleColor()))
        //entities[entities.count-1].addParent(self)
        self.backgroundColor = NSColor.blackColor()

        //image = SKSpriteNode(imageNamed: "uyen.jpg")
        //image.size = self.frame.size
        //image.position = CGPointMake(self.size.width / 2, self.size.height / 2)
        //self.addChild(image)
        
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
    
    override func keyDown(theEvent: NSEvent) {
        NSLog("Key: \(theEvent.charactersIgnoringModifiers), \(theEvent.keyCode)")
        
        var key = theEvent.charactersIgnoringModifiers!
        //var a =
        
        if theEvent.keyCode == 0 {
           NSLog("A")
       }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        var sign1: Int, sign2: Int
        var randomX: Float, randomY: Float

        sign1 = arc4random_uniform(2) == 1 ? 1 : -1
        randomX = Float(sign1 * Int(arc4random_uniform(40)))
        sign2 = arc4random_uniform(2) == 1 ? 1 : -1
        randomY = Float(sign2 * Int(arc4random_uniform(40)))

        if !entities.isEmpty {
            entities[entityIndex].animate(self, x: randomX, y: randomY)
            entityIndex++
            entityIndex %= entities.count
        }
        
        //NSLog("Index: \(entityIndex)")
        
    }
}
