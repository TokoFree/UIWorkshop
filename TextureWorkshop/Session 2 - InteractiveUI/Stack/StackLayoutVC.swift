//
//  StackLayoutVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class StackLayoutVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let pinkNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.preferredSize = CGSize(width: 120, height: 120)
        node.backgroundColor = .systemPink
        return node
    }()
    
    private let cyanNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.preferredSize = CGSize(width: 120, height: 120)
        node.backgroundColor = .cyan
        return node
    }()
    
    // MARK: Properties
    
    private var direction: ASStackLayoutDirection = .horizontal
    private var spacing: CGFloat = 0
    private var justify: ASStackLayoutJustifyContent = .start
    private var align: ASStackLayoutAlignItems = .start
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            
            return ASStackLayoutSpec(
                direction: self.direction,
                spacing: self.spacing,
                justifyContent: self.justify,
                alignItems: self.align,
                children: [self.pinkNode, self.cyanNode]
            )
        }
    }
    
    // MARK: Functions
    
    internal func setDirection(_ val: ASStackLayoutDirection) {
        direction = val
        node.setNeedsLayout()
    }
    
    internal func setSpacing(_ val: CGFloat) {
        spacing = val
        node.setNeedsLayout()
    }
    
    internal func setJustify(_ val: ASStackLayoutJustifyContent) {
        justify = val
        node.setNeedsLayout()
    }
    
    internal func setAlign(_ val: ASStackLayoutAlignItems) {
        align = val
        node.setNeedsLayout()
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

