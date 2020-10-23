//
//  WrapperLayoutVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 08/10/20.
//

import Foundation
import AsyncDisplayKit

internal class WrapperLayoutVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let pinkBoxNode = ASDisplayNode()
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            return ASWrapperLayoutSpec(layoutElement: self.pinkBoxNode)
        }
        
        setupPinkNode()
    }
    
    // MARK: Functions
    
    private func setupPinkNode() {
        pinkBoxNode.style.preferredSize = CGSize(width: 200, height: 100)
        pinkBoxNode.backgroundColor = .systemPink
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
