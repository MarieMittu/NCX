//
//  Fuel.swift
//  NCX
//
//  Created by Maria Smirnova on 28/03/22.
//

import SpriteKit

struct Fuel: Codable {
    struct FuelBenzina: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let benzinas: [FuelBenzina]
}
