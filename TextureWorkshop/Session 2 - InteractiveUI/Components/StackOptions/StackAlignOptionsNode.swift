//
//  StackAlignOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class StackAlignOptionsNode: ASDisplayNode {
    
    // MARK: UI Elements
    
    private let buttonStart: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("start", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonCenter: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("center", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonEnd: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("end", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonStretch: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("stretch", with: .none, with: .black, for: .normal)
        return node
    }()
    
    // MARK: Properties
    
    internal var onPicked: ((ASStackLayoutAlignItems) -> Void)?
    
    // MARK: Initialization
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    internal override func didLoad() {
        super.didLoad()
        
        buttonStart.addTarget(self, action: #selector(tapButtonStart), forControlEvents: .touchUpInside)
        buttonCenter.addTarget(self, action: #selector(tapButtonCenter), forControlEvents: .touchUpInside)
        buttonEnd.addTarget(self, action: #selector(tapButtonEnd), forControlEvents: .touchUpInside)
        buttonStretch.addTarget(self, action: #selector(tapButtonStretch), forControlEvents: .touchUpInside)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [buttonStart, buttonCenter, buttonEnd])
    }
    
    // MARK: Functions
    
    @objc func tapButtonStart() {
        buttonCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonEnd.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStretch.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonStart.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.start)
    }
    
    @objc func tapButtonCenter() {
        buttonStart.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonEnd.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStretch.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonCenter.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.center)
    }
    
    @objc func tapButtonEnd() {
        buttonCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStart.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStretch.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonEnd.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.end)
    }
    
    @objc func tapButtonStretch() {
        buttonCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonEnd.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStart.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonStretch.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.stretch)
    }
}

