//
//  PlayerNode.swift
//  NCX
//
//  Created by Maria Smirnova on 28/03/22.
//

import Foundation
import SpriteKit

class PlayerNode: SKSpriteNode {
    struct PhysicsCategory {
      static let none      : UInt32 = 0
      static let all       : UInt32 = UInt32.max
      static let benzina   : UInt32 = 0b1       // 1
      static let player: UInt32 = 0b10      // 2
    }
    
    var life: Int = 1
    
    init(imageNamed: String) {
        
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .purple, size: texture.size())
        
        name = "susanin"
        position.x = frame.minX + 90
        position.y = frame.maxY + 70
        zPosition = 1
//       size = CGSize(width: 40, height: 80)
//        position = CGPoint(x: 100, y: 100)
        
        physicsBody = SKPhysicsBody(texture: self.texture!, size: self.texture!.size())
        physicsBody?.isDynamic = true
        physicsBody?.categoryBitMask = PhysicsCategory.player
        physicsBody?.collisionBitMask = PhysicsCategory.none
        physicsBody?.contactTestBitMask = PhysicsCategory.benzina
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
