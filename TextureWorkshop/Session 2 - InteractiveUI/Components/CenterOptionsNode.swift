//
//  CenterOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class CenterOptionsNode: ASDisplayNode {
    
    // MARK: UI Elements
    
    private let buttonX: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle(".X", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonY: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle(".Y", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonXY: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle(".XY", with: .none, with: .black, for: .normal)
        return node
    }()
    
    // MARK: Properties
    
    internal var onPicked: ((ASCenterLayoutSpecCenteringOptions) -> Void)?
    
    // MARK: Initialization
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    internal override func didLoad() {
        super.didLoad()
        buttonX.addTarget(self, action: #selector(tapButtonX), forControlEvents: .touchUpInside)
        buttonY.addTarget(self, action: #selector(tapButtonY), forControlEvents: .touchUpInside)
        buttonXY.addTarget(self, action: #selector(tapButtonXY), forControlEvents: .touchUpInside)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [buttonX, buttonY, buttonXY])
    }
    
    // MARK: Functions
    
    @objc func tapButtonX() {
        buttonY.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonXY.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonX.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.X)
    }
    
    @objc func tapButtonY() {
        buttonX.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonXY.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonY.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.Y)
    }
    
    @objc func tapButtonXY() {
        buttonY.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonX.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonXY.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.XY)
    }
}
