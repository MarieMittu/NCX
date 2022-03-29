//
//  CarNode.swift
//  NCX
//
//  Created by Maria Smirnova on 28/03/22.
//

import SpriteKit

class CarNode: SKSpriteNode {
    var type: CarType

    
    init(type: CarType, startPosition: CGPoint, xOffset: CGFloat, moveStraight: Bool) {
        self.type = type
        
        let texture = SKTexture(imageNamed: type.name)
        super.init(texture: texture, color: .white, size: texture.size())
        size = CGSize(width: 60, height: 100)
        
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
//        physicsBody?.categoryBitMask = CollisionType.car.rawValue
//        physicsBody?.collisionBitMask = CollisionType.player.rawValue | CollisionType.playerWeapon.rawValue
//        physicsBody?.contactTestBitMask = CollisionType.player.rawValue | CollisionType.playerWeapon.rawValue
        name = "car"
        position = CGPoint(x: startPosition.x + xOffset, y: startPosition.y)
        configureMovement(moveStraight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
                   
    func configureMovement(_ moveStraight: Bool) {
           let path = UIBezierPath()
            path.move(to: .zero)
            
            if moveStraight {
                path.addLine(to: CGPoint(x: -10000, y: 0))
            } else {
                path.addCurve(to: CGPoint(x: -3500, y: 0), controlPoint1: CGPoint(x: 0, y: -position.y * 4), controlPoint2: CGPoint(x: -1000, y: -position.y))
            }
            let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: type.speed)
            let sequence = SKAction.sequence([movement, .removeFromParent()])
            run(sequence)
        }
}
