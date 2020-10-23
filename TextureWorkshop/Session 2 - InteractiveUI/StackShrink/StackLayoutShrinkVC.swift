//
//  StackLayoutShrinkVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class StackLayoutShrinkVC: ASDKViewController<ASDisplayNode> {
    
    internal enum ShrinkBoxes {
        case cyan
        case pink
    }
    
    // MARK: UI Elements
    
    private let pinkNode = BoxNode(color: .systemPink, size: CGSize(width: 120, height: 120), updateSizeText: true)
    private let cyanNode = BoxNode(color: .cyan, size: CGSize(width: 320, height: 120), updateSizeText: true)
    
    // MARK: Properties
    
    private var direction: ASStackLayoutDirection = .horizontal
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        node.clipsToBounds = false
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            
            return ASStackLayoutSpec(
                direction: self.direction,
                spacing: 0,
                justifyContent: .start,
                alignItems: .start,
                children: [self.pinkNode, self.cyanNode]
            )
        }
    }
    
    // MARK: Functions
    
    internal func setDirection(_ val: ASStackLayoutDirection) {
        direction = val
        node.setNeedsLayout()
    }
    
    internal func setFlexShrink(box: ShrinkBoxes, val: Bool) {
        switch box {
        case .pink:
            pinkNode.style.flexShrink = val ? 1 : 0
        case .cyan:
            cyanNode.style.flexShrink = val ? 1 : 0
        }
        node.setNeedsLayout()
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



