//
//  GameScene.swift
//  NCX
//
//  Created by Maria Smirnova on 28/03/22.
//

//import SpriteKit
//
//
//
//
//enum CollisionType: UInt32 {
//    case car = 1
//    case player = 4
//    case benzina = 8
//}
//
//
//class GameScene: SKScene {
//
//    let texture = SKTexture(imageNamed: "benzina")
//
//    struct PhysicsCategory {
//      static let none      : UInt32 = 0
//      static let all       : UInt32 = UInt32.max
//      static let benzina   : UInt32 = 0b1       // 1
//      static let player: UInt32 = 0b10      // 2
//    }
//
////    private var player = PlayerNode(imageNamed: "susanin")
//    private var player = SKSpriteNode()
//    private var playerWalkingFrames: [SKTexture] = []
//    var isPlayerAlive = true
//
////    private var benzina = BenzinaNode(imageNamed: "benzina")
//
//
////    let waves = Bundle.main.decode([Wave].self, from: "waves.json")
////    let carTypes = Bundle.main.decode([CarType].self, from: "car-types.json")
////    var waveNumber = 0
////    var levelNumber = 0
//
//    let positions = Array(stride(from: -320, through: 320, by: 80))
//
//    func random() -> CGFloat {
//      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
//    }
//
//    func random(min: CGFloat, max: CGFloat) -> CGFloat {
//      return random() * (max - min) + min
//    }
//
//    func addBenzina() {
//
//      // Create sprite
//      let benzina = BenzinaNode(imageNamed: "benzina")
//
//        physicsBody = SKPhysicsBody(texture: texture, size: self.size)
//        physicsBody?.categoryBitMask = PhysicsCategory.benzina
//        physicsBody?.collisionBitMask = PhysicsCategory.player
//        physicsBody?.contactTestBitMask = PhysicsCategory.none
//        physicsBody?.mass = 10
//        physicsBody?.angularVelocity = 0.8
//        zPosition = 1
//
//      // Determine where to spawn the monster along the Y axis
//      let actualY = random(min: benzina.size.height/2, max: size.height - benzina.size.height/2)
//
//      // Position the monster slightly off-screen along the right edge,
//      // and along a random position along the Y axis as calculated above
//        benzina.position = CGPoint(x: size.width + benzina.size.width/2, y: actualY)
//
//      // Add the monster to the scene
//      addChild(benzina)
//
//
//      // Determine speed of the monster
//      let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
//
//      // Create the actions
//      let actionMove = SKAction.move(to: CGPoint(x: -benzina.size.width/2, y: actualY),
//                                     duration: TimeInterval(actualDuration))
//      let actionMoveDone = SKAction.removeFromParent()
//        benzina.run(SKAction.sequence([actionMove, actionMoveDone]))
//
//
//    }
//
//
////    func random() -> CGFloat {
////      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
////    }
////
////    func random(min: CGFloat, max: CGFloat) -> CGFloat {
////      return random() * (max - min) + min
////    }
//
////    func addCar() {
////
////      // Create sprite
////
////
////      // Determine where to spawn the monster along the Y axis
////      let actualY = random(min: car.size.height/2, max: size.height - car.size.height/2)
////
////      // Position the monster slightly off-screen along the right edge,
////      // and along a random position along the Y axis as calculated above
////      car.position = CGPoint(x: size.width + car.size.width/2, y: actualY)
////
////      // Add the monster to the scene
////      addChild(car)
////
////      // Determine speed of the monster
////      let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
////
////      // Create the actions
////      let actionMove = SKAction.move(to: CGPoint(x: -car.size.width/2, y: actualY),
////                                     duration: TimeInterval(actualDuration))
////      let actionMoveDone = SKAction.removeFromParent()
////      car.run(SKAction.sequence([actionMove, actionMoveDone]))
////    }
//
//
//
//    override func didMove(to view: SKView) {
//        physicsWorld.gravity = .zero
//        physicsWorld.contactDelegate = self
////        self.addChild(player)
////        player.animateSusanin()
////        self.addChild(benzina)
//        run(SKAction.repeatForever(
//              SKAction.sequence([
//                SKAction.run(addBenzina),
//                SKAction.wait(forDuration: 3.0)
//                ])
//            ))
//        buildPlayer()
//
//        func animatePlayer() {
//          player.run(SKAction.repeatForever(
//            SKAction.animate(with: playerWalkingFrames,
//                             timePerFrame: 0.2,
//                             resize: false,
//                             restore: true)),
//            withKey:"walkingInPlacePlayer")
//        }
//
//        animatePlayer()
//    }
//
//    func buildPlayer() {
//      let playerAnimatedAtlas = SKTextureAtlas(named: "PlayerImages")
//      var walkFrames: [SKTexture] = []
//
//      let numImages = playerAnimatedAtlas.textureNames.count
//        for i in 1...numImages {
//        let playerTextureName = "susanin\(i)"
//        walkFrames.append(playerAnimatedAtlas.textureNamed(playerTextureName))
//      }
//      playerWalkingFrames = walkFrames
//
//        let firstFrameTexture = playerWalkingFrames[0]
//        player = SKSpriteNode(texture: firstFrameTexture)
//        player.position = CGPoint(x: frame.minX + 90, y: frame.minY + 160)
//        addChild(player)
//
//    }
//
//
////    func createWave() {
////        guard isPlayerAlive else {return}
////
////        if waveNumber == waves.count {
////            levelNumber += 1
////            waveNumber = 0
////        }
////
////        let currentWave = waves[waveNumber]
////        waveNumber += 1
////
////        let maximumCarType = min(carTypes.count, levelNumber + 1)
////        let carType = Int.random(in: 0..<maximumCarType)
////
////        let carOffsetX: CGFloat = 100
////        let carStartX = 600
////
////        if currentWave.cars.isEmpty {
////            for (index, position) in positions.shuffled().enumerated() {
////                let node = CarNode(type: carTypes[carType], startPosition: CGPoint(x: carStartX, y: position), xOffset: carOffsetX * CGFloat(index * 3), moveStraight: true)
////                addChild(node)
////            }
////        } else {
////            for car in currentWave.cars {
////                let node = CarNode(type: carTypes[carType], startPosition: CGPoint(x: carStartX, y: positions[car.position]), xOffset: carOffsetX * car.xOffset, moveStraight: car.moveStraight)
////                addChild(node)
////            }
////        }
////    }
//
//
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//
////        let activeCars = children.compactMap {$0 as? CarNode}
////
////        if activeCars.isEmpty {
////            createWave()
////        }
//    }
//
//
//
//    func playerDidCollideWithBenzina(player: SKSpriteNode, benzina: SKSpriteNode) {
//
//      benzina.removeFromParent()
//    }
//
//}
//
//extension GameScene: SKPhysicsContactDelegate {
//
//    func didBegin(_ contact: SKPhysicsContact) {
////      // 1
////      var firstBody: SKPhysicsBody
////      var secondBody: SKPhysicsBody
////      if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
////        firstBody = contact.bodyA
////        secondBody = contact.bodyB
////      } else {
////        firstBody = contact.bodyB
////        secondBody = contact.bodyA
////      }
////
////      // 2
////      if ((firstBody.categoryBitMask & PhysicsCategory.benzina != 0) &&
////          (secondBody.categoryBitMask & PhysicsCategory.player != 0)) {
////        if let benzina = firstBody.node as? SKSpriteNode,
////          let player = secondBody.node as? SKSpriteNode {
////            playerDidCollideWithBenzina(player: player, benzina: benzina)
////        }
////      }
////    }
//
////        let firstBody: SKPhysicsBody = contact.bodyA
////        let secondBody: SKPhysicsBody = contact.bodyB
////
////        if let node = firstBody.node, node.name == "benzina"{
////            node.removeFromParent()
////        }
////        if let node = secondBody.node, node.name == "benzina"{
////            node.removeFromParent()
////        }
//        guard let nodeA = contact.bodyA.node else {return}
//        guard let nodeB = contact.bodyB.node else {return}
//
//        let sortedNodes = [nodeA, nodeB].sorted {$0.name ?? "" < $1.name ?? ""}
//        let firstNode = sortedNodes[0]
//        let secondNode = sortedNodes[1]
//
//        if firstNode.name == "benzina" {
//            firstNode.removeFromParent()
//            if secondNode.name == "player" {
//
//            }
//            }
//        }
//
//
//}
//


//MARK: Luca version

import SpriteKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "susanin1")
    
    override func didMove(to view: SKView) { //initial set up of the view
        backgroundColor = SKColor.black
        
        let background = SKSpriteNode(imageNamed: "median axes")
        
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        //centers the image since 0,0 is considered the lower left corner of the parent Game Scene in Sprite Kit
        background.zPosition = -1
        //to avoid background to be drawn on top on other sprites, sets the drawing priority to -1
        addChild(background)
        //adds the background image to the parent Game Scene, otherwise it wouldn't be displayed
        
        player.position = CGPoint(x: size.width/14, y: size.height/2)
        player.setScale(1.3)
        
        addChild(player)
        
        enemyCycle()
    }
    
    func spawnCar() {
      let car = SKSpriteNode(imageNamed: "carPolice")

      car.position = CGPoint(x: size.width + car.size.width/2, y: size.height/2)
      car.setScale(2.5)
        
//    let texture = SKTexture(imageNamed: "Car 2")
//    enemy.physicsBody = SKPhysicsBody(texture: texture, size: self.size)
        
      addChild(car)
        
        car.name = "car"
        
        let actionMove = SKAction.move(
          to: CGPoint(x: -car.size.width/2, y: car.position.y),
          duration: 2.0)
        car.run(actionMove)
        
        car.run(SKAction.sequence([
                SKAction.wait(forDuration: 5.0),
                SKAction.removeFromParent()
            ]))
        
        //removes the node after it goes out of the screen
        
    }
    //spawns an enemy right out of the view
    
    func enemyCycle() {
        let createCarAction = SKAction.run(spawnCar)
        let waitAction = SKAction.wait(forDuration: 5.0)
        
        let createAndWaitAction = SKAction.sequence([createCarAction, waitAction])
        let carCycleAction = SKAction.repeatForever(createAndWaitAction)
        
        run(carCycleAction)
        
    }
    //loops the car's spawn
    
    func playerHit(car: SKSpriteNode){
        car.removeFromParent()
    }
    
    func checkCollisions() {
      var hitCars: [SKSpriteNode] = []
      enumerateChildNodes(withName: "car") { node, _ in
        let car = node as! SKSpriteNode
        if car.frame.intersects(self.player.frame) {
          hitCars.append(car)
        }
      }
      for car in hitCars {
        playerHit(car: car)
      }
      }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        checkCollisions()
}
}
    
