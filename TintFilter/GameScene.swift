//
//  GameScene.swift
//  TintFilter
//
//  Created by Lorenzo St Dubois on 5/20/18.
//  Copyright © 2018 Ludicode. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private let ColorfulCow = "colorful_cow"
    private let RainbowDragon = "rainbow_dragon"

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.scaleMode = .resizeFill
        
        self.backgroundColor = UIColor.black
        
        for i in 0..<5 {
            let sprite = SKSpriteNode(imageNamed: ColorfulCow)
            sprite.position = CGPoint(x: 100, y: 100+(i*125))
            sprite.color = .red
            sprite.colorBlendFactor = 0.25*CGFloat(i)
            sprite.setScale(2.0)
            self.addChild(sprite)
        }
        
        for i in 0..<5 {
            let effect = SKEffectNode()
            effect.position = CGPoint(x: 300, y: 100+(i*125))
            let sprite = SKSpriteNode(imageNamed: ColorfulCow)
            let colorBlendFactor = 0.25*CGFloat(i)
            effect.filter = TintFilter(color: .red, colorBlendFactor: colorBlendFactor)
            effect.shouldRasterize = true
            effect.shouldEnableEffects = true
            effect.setScale(2.0)
            effect.addChild(sprite)
            self.addChild(effect)
        }
    }

}
