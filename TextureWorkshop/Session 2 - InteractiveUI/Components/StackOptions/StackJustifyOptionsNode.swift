//
//  StackJustifyOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class StackJustifyOptionsNode: ASScrollNode {
    
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
    
    private let buttonSpaceBetween: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("spaceBetween", with: .none, with: .black, for: .normal)
        return node
    }()
    
    private let buttonSpaceAround: ASButtonNode = {
        let node = ASButtonNode()
        node.setTitle("spaceAround", with: .none, with: .black, for: .normal)
        return node
    }()
    
    // MARK: Properties
    
    internal var onPicked: ((ASStackLayoutJustifyContent) -> Void)?
    
    // MARK: Initialization
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
        automaticallyManagesContentSize = true
        scrollableDirections = [.left, .right]
        view.showsHorizontalScrollIndicator = false
    }
    
    internal override func didLoad() {
        super.didLoad()
        
        buttonStart.addTarget(self, action: #selector(tapButtonStart), forControlEvents: .touchUpInside)
        buttonCenter.addTarget(self, action: #selector(tapButtonCenter), forControlEvents: .touchUpInside)
        buttonEnd.addTarget(self, action: #selector(tapButtonEnd), forControlEvents: .touchUpInside)
        buttonSpaceBetween.addTarget(self, action: #selector(tapButtonSpaceBetween), forControlEvents: .touchUpInside)
        buttonSpaceAround.addTarget(self, action: #selector(tapButtonSpaceAround), forControlEvents: .touchUpInside)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [buttonStart, buttonCenter, buttonEnd, buttonSpaceBetween, buttonSpaceAround])
    }
    
    // MARK: Functions
    
    @objc func tapButtonStart() {
        buttonCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonEnd.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceBetween.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceAround.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonStart.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.start)
    }
    
    @objc func tapButtonCenter() {
        buttonStart.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonEnd.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceBetween.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceAround.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonCenter.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.center)
    }
    
    @objc func tapButtonEnd() {
        buttonCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStart.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceBetween.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceAround.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonEnd.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.end)
    }
    
    @objc func tapButtonSpaceBetween() {
        buttonCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonEnd.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStart.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceAround.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonSpaceBetween.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.spaceBetween)
    }
    
    @objc func tapButtonSpaceAround() {
        buttonCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonEnd.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonSpaceBetween.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        buttonStart.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        buttonSpaceAround.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        onPicked?(.spaceAround)
    }
}
