//
//  StackDirectionOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class StackDirectionOptionsNode: ASDisplayNode {
    
    // MARK: UI Elements
    
    private let buttonVertical: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle(".vertical", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonHorizontal: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle(".horizontal", with: .none, with: .black, for: .normal)
        return node
    }()
    
    // MARK: Properties
    
    internal var onPicked: ((ASStackLayoutDirection) -> Void)?
    
    // MARK: Initialization
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    internal override func didLoad() {
        super.didLoad()
        
        buttonVertical.addTarget(self, action: #selector(tapbuttonVertical), forControlEvents: .touchUpInside)
        buttonHorizontal.addTarget(self, action: #selector(tapbuttonHorizontal), forControlEvents: .touchUpInside)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [buttonVertical, buttonHorizontal])
    }
    
    // MARK: Functions
    
    @objc func tapbuttonVertical() {
        buttonHorizontal.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonVertical.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.vertical)
    }
    
    @objc func tapbuttonHorizontal() {
        buttonVertical.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonHorizontal.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.horizontal)
    }
}
