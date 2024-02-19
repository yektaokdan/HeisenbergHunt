//
//  GameScene.swift
//  HeisenbergHunt
//
//  Created by yekta on 19.02.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var walter = SKSpriteNode()
    var gus1 = SKSpriteNode()
    var gus2 = SKSpriteNode()
    var gus3 = SKSpriteNode()
    var gus4 = SKSpriteNode()
    var gus5 = SKSpriteNode()
    var gus6 = SKSpriteNode()
    
    var gameStarted = false
    var originalPosition : CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    enum ColliderType: UInt32{
        case Walter = 1
        case Gus = 2
    }
    override func didMove(to view: SKView) {
        /*
         let texture = SKTexture(imageNamed: "walterwhite")
         walter = SKSpriteNode(texture: texture)
         walter.position = CGPoint(x: 0, y: 0)
         walter.size = CGSize(width: self.frame.width / 12, height: self.frame.height / 5)
         walter.zPosition = 1
         self.addChild(walter)
         */
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        walter = childNode(withName: "walter") as! SKSpriteNode
        let walterTexture = SKTexture(imageNamed: "walter")
        
        walter.physicsBody = SKPhysicsBody(circleOfRadius: walterTexture.size().height / 2)
        walter.physicsBody?.affectedByGravity = false
        walter.physicsBody?.isDynamic = true
        walter.physicsBody?.mass = 0.2
        originalPosition = walter.position
        walter.physicsBody?.contactTestBitMask =  ColliderType.Walter.rawValue
        walter.physicsBody?.categoryBitMask = ColliderType.Walter.rawValue
        walter.physicsBody?.collisionBitMask = ColliderType.Gus.rawValue
        
        let boxTexture = SKTexture(imageNamed: "gus")
        let size = CGSize(width: boxTexture.size().width/1, height: boxTexture.size().height / 1)
        
        
        gus1 = childNode(withName: "gus1") as! SKSpriteNode
        gus1.physicsBody = SKPhysicsBody(rectangleOf: size)
        gus1.physicsBody?.isDynamic = true
        gus1.physicsBody?.affectedByGravity = true
        gus1.physicsBody?.allowsRotation = true
        gus1.physicsBody?.mass = 0.1
        gus1.physicsBody?.collisionBitMask = ColliderType.Walter.rawValue
        
        gus2 = childNode(withName: "gus2") as! SKSpriteNode
        gus2.physicsBody = SKPhysicsBody(rectangleOf: size)
        gus2.physicsBody?.isDynamic = true
        gus2.physicsBody?.affectedByGravity = true
        gus2.physicsBody?.allowsRotation = true
        gus2.physicsBody?.mass = 0.1
        gus2.physicsBody?.collisionBitMask = ColliderType.Walter.rawValue
    
        gus3 = childNode(withName: "gus3") as! SKSpriteNode
        gus3.physicsBody = SKPhysicsBody(rectangleOf: size)
        gus3.physicsBody?.isDynamic = true
        gus3.physicsBody?.affectedByGravity = true
        gus3.physicsBody?.allowsRotation = true
        gus3.physicsBody?.mass = 0.1
        gus3.physicsBody?.collisionBitMask = ColliderType.Walter.rawValue
        
        gus4 = childNode(withName: "gus4") as! SKSpriteNode
        gus4.physicsBody = SKPhysicsBody(rectangleOf: size)
        gus4.physicsBody?.isDynamic = true
        gus4.physicsBody?.affectedByGravity = true
        gus4.physicsBody?.allowsRotation = true
        gus4.physicsBody?.mass = 0.1
        gus4.physicsBody?.collisionBitMask = ColliderType.Walter.rawValue
    
        gus5 = childNode(withName: "gus5") as! SKSpriteNode
        gus5.physicsBody = SKPhysicsBody(rectangleOf: size)
        gus5.physicsBody?.isDynamic = true
        gus5.physicsBody?.affectedByGravity = true
        gus5.physicsBody?.allowsRotation = true
        gus5.physicsBody?.mass = 0.1
        gus5.physicsBody?.collisionBitMask = ColliderType.Walter.rawValue
        
        gus6 = childNode(withName: "gus6") as! SKSpriteNode
        gus6.physicsBody = SKPhysicsBody(rectangleOf: size)
        gus6.physicsBody?.isDynamic = true
        gus6.physicsBody?.affectedByGravity = true
        gus6.physicsBody?.allowsRotation = true
        gus6.physicsBody?.mass = 0.1
        gus6.physicsBody?.collisionBitMask = ColliderType.Walter.rawValue
        

        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.Walter.rawValue || contact.bodyB.collisionBitMask == ColliderType.Walter.rawValue {
            score += 1
            scoreLabel.text = String(score)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first{
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false{
                    for node in touchNodes{
                        if let sprite = node as? SKSpriteNode{
                            if sprite == walter{
                                walter.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first{
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false{
                    for node in touchNodes{
                        if let sprite = node as? SKSpriteNode{
                            if sprite == walter{
                                walter.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first{
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false{
                    for node in touchNodes{
                        if let sprite = node as? SKSpriteNode{
                            if sprite == walter{
                               let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                let impulse = CGVector(dx: dx, dy: dy)
                                walter.physicsBody?.applyImpulse(impulse)
                                walter.physicsBody?.affectedByGravity = true
                                gameStarted = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let walterPhysics = walter.physicsBody{
            if walterPhysics.velocity.dx <= 0.1 && walterPhysics.velocity.dy <= 0.1 && walterPhysics.angularVelocity <= 0.1 && gameStarted == true{
                walter.physicsBody?.affectedByGravity = false
                walter.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                walter.physicsBody?.angularVelocity = 0
                walter.zPosition = 1
                walter.position = originalPosition!
                score = 0
                scoreLabel.text = String(score)
                gameStarted = false
            }
        }
    }
}
