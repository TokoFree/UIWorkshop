//
//  InsetOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 12/10/20.
//

import Foundation
import AsyncDisplayKit

internal class InsetOptionsNode: ASDisplayNode {
    
    // MARK: UI Elements
    
    private let button0: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("0", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let button16: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("16", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let button48: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("48", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonInfinity: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle(".infinity", with: .none, with: .black, for: .normal)
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
        button0.addTarget(self, action: #selector(tapButton0), forControlEvents: .touchUpInside)
        button16.addTarget(self, action: #selector(tapButton16), forControlEvents: .touchUpInside)
        button48.addTarget(self, action: #selector(tapButton48), forControlEvents: .touchUpInside)
        buttonInfinity.addTarget(self, action: #selector(tapButtonInfinity), forControlEvents: .touchUpInside)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [button0, button16, button48, buttonInfinity])
    }
    
    // MARK: Functions
    
    @objc func tapButton0() {
        button16.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button48.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonInfinity.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button0.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(0)
    }
    
    @objc func tapButton16() {
        button0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button48.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonInfinity.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button16.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(16)
    }
    
    @objc func tapButton48() {
        button16.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonInfinity.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button48.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(48)
    }
    
    @objc func tapButtonInfinity() {
        button16.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button48.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        button0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonInfinity.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.infinity)
    }
}

// MARK: Enum

internal enum InsetSide {
    case top, bottom, left, right
}
