//
//  GameScene.swift
//  IOS_sample
//
//  Created by 吉田れい on 2019/05/24.
//  Copyright © 2019 吉田れい. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate {
    
    var ball:SKSpriteNode!
    var paddle:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        //withname にはGameScene.sksで作成した名前
        ball   = self.childNode(withName: "ball") as? SKSpriteNode
        paddle = self.childNode(withName: "paddle") as? SKSpriteNode
        
        //ボールの飛んでいく方向
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        
        //壁にボールがぶつかった時、跳ねかえる
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        //SKPhysicsContactDelegate をクラス参照に入れてないとエラーとなる
        self.physicsWorld.contactDelegate = self
        
    }
    
    //パドル
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let toucLocation = touch.location(in: self)
            paddle.position.x = toucLocation.x
        }
    }
    
    //パドル
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let toucLocation = touch.location(in: self)
            paddle.position.x = toucLocation.x
        }
    }
    
    //ボールがブロックに当たると消える。
    func didBegin(_ contact : SKPhysicsContact)
    {
        let bodyAName = contact.bodyA.node?.name;
        let bodyBName = contact.bodyB.node?.name;
        
        if bodyAName == "ball" && bodyBName == "brick" ||
            bodyAName == "brick" && bodyBName == "ball"
        {
            if bodyAName == "brick"
            {
                contact.bodyA.node?.removeFromParent()
            }
            else if bodyBName == "brick"
            {
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
        
}

