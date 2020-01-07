//
//  ViewController.swift
//  ToySoldier2
//
//  Created by Craig Larson on 11/3/19.
//  Copyright © 2019 Craig Larson. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var anchor:Toy.Scene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        anchor = try! Toy.Scene()
//        anchor.generateCollisionShapes(recursive: true)
//        arView.scene.anchors.append(anchor)
//
//        anchor.notifications.trigger.post()
        
        
        let entity = try! ModelEntity.loadModel(named: "toy_robot_vintage")
        
        entity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation, .scale], for: entity)
        
        let anchor: AnchorEntity = AnchorEntity(plane: .horizontal, classification: .any)
        
        arView.scene.addAnchor(anchor)
        
        anchor.addChild(entity)
        
    }
    
    
}
