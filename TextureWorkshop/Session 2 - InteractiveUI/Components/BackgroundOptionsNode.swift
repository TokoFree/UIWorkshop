//
//  BackgroundOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class BackgroundOptionsNode: ASDisplayNode {
    
    // MARK: UI Elements
    
    private let buttonShort: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("short", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonMedium: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("medium", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonLong: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("long", with: .none, with: .black, for: .normal)
        return node
    }()
    
    // MARK: Properties
    
    internal var onPicked: ((TextType) -> Void)?
    
    // MARK: Initialization
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    internal override func didLoad() {
        super.didLoad()
        buttonShort.addTarget(self, action: #selector(tapButtonShort), forControlEvents: .touchUpInside)
        buttonMedium.addTarget(self, action: #selector(tapButtonMedium), forControlEvents: .touchUpInside)
        buttonLong.addTarget(self, action: #selector(tapButtonLong), forControlEvents: .touchUpInside)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [buttonShort, buttonMedium, buttonLong])
    }
    
    // MARK: Functions
    
    @objc func tapButtonShort() {
        buttonMedium.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonLong.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonShort.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.short)
    }
    
    @objc func tapButtonMedium() {
        buttonShort.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonLong.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonMedium.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.medium)
    }
    
    @objc func tapButtonLong() {
        buttonMedium.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonShort.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonLong.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        
        onPicked?(.long)
    }
}

// MARK: Enum

internal enum TextType {
    case short, medium, long
}
