//
//  OverlayOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class OverlayOptionsNode: ASDisplayNode {
    
    // MARK: UI Elements
    
    private let button20: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("0.2", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let button50: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("0.5", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let button100: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("1.0", with: .none, with: .black, for: .normal)
        return node
    }()
    
    // MARK: Properties
    
    internal var onPicked: ((CGFloat) -> Void)?
    
    // MARK: Initialization
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    internal override func didLoad() {
        super.didLoad()
        button20.addTarget(self, action: #selector(tapButton20), forControlEvents: .touchUpInside)
        button50.addTarget(self, action: #selector(tapButton50), forControlEvents: .touchUpInside)
        button100.addTarget(self, action: #selector(tapButton100), forControlEvents: .touchUpInside)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [button20, button50, button100])
    }
    
    // MARK: Functions
    
    @objc func tapButton20() {
        button50.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button100.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button20.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(0.2)
    }
    
    @objc func tapButton50() {
        button20.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button100.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button50.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(0.5)
    }
    
    @objc func tapButton100() {
        button50.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button20.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button100.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(1)
    }
}
