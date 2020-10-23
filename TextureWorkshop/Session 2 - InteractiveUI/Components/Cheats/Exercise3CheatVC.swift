//
//  Exercise2CheatVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 16/10/20.
//

import Foundation
import AsyncDisplayKit

internal class Exercise3CheatVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    /*
     
     STEPS
     1. init customNode instead of many elements
     2. return inset with the node as child
     3. achieve same result as LayoutExercise1 but with custom node
     
     DON'T FORGET TO CHANGE TO `CustomNode()`
     
     */
    private let customNode = KustomNodeCheat()
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(
                    top: 16,
                    left: 16,
                    bottom: .infinity,
                    right: .infinity
                ),
                child: self.customNode
            )
        }
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

