//
//  BenzinaNode.swift
//  NCX
//
//  Created by Maria Smirnova on 28/03/22.
//

import SpriteKit

class BenzinaNode: SKSpriteNode {
    struct PhysicsCategory {
      static let none      : UInt32 = 0
      static let all       : UInt32 = UInt32.max
      static let benzina   : UInt32 = 0b1       // 1
      static let player: UInt32 = 0b10      // 2
    }
    var life = 1
    
    init(imageNamed: String) {
        
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .purple, size: texture.size())
        
        name = "benzina"
        physicsBody = SKPhysicsBody(texture: texture, size: self.size)
        physicsBody?.categoryBitMask = PhysicsCategory.benzina
        physicsBody?.collisionBitMask = PhysicsCategory.none
        physicsBody?.contactTestBitMask = PhysicsCategory.player
        physicsBody?.mass = 10
        physicsBody?.angularVelocity = 0.8
        zPosition = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
