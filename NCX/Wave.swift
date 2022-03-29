//
//  Wave.swift
//  Zaptastic
//
//  Created by Maria Smirnova on 07/02/22.
//

import SpriteKit

struct Wave: Codable {
    struct WaveCar: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let cars: [WaveCar]
}
