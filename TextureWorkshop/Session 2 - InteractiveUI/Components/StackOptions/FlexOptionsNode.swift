//
//  FlexGrowOptionsNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import Foundation
import AsyncDisplayKit

internal class FlexOptionsNode: ASDisplayNode {
    
    // MARK: Enum
    
    internal enum FlexType {
        case grow, shrink
    }
    
    // MARK: UI Elements
    
    private let buttonFlex: ASButtonNode = {
        let node = ASButtonNode()
        return node
    }()
    
    // MARK: Properties
    
    internal var onPicked: ((Bool) -> Void)?
    internal var isFlex: Bool = false
    
    // MARK: Initialization
    
    internal init(type: FlexType) {
        super.init()
        automaticallyManagesSubnodes = true
        
        if type == .grow {
            buttonFlex.setTitle("flexGrow", with: .none, with: .black, for: .normal)
        } else {
            buttonFlex.setTitle("flexShrink", with: .none, with: .black, for: .normal)
        }
    }
    
    internal override func didLoad() {
        super.didLoad()
        buttonFlex.addTarget(self, action: #selector(tapButtonFlex), forControlEvents: .touchUpInside)
        
        buttonFlex.backgroundColor = isFlex
            ? UIColor.green.withAlphaComponent(0.2)
            : UIColor.red.withAlphaComponent(0.2)
    }
    
    // MARK: Layouting
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .center, children: [buttonFlex])
    }
    
    // MARK: Functions
    
    @objc func tapButtonFlex() {
        isFlex.toggle()
        
        buttonFlex.backgroundColor = isFlex
            ? UIColor.green.withAlphaComponent(0.2)
            : UIColor.red.withAlphaComponent(0.2)

        onPicked?(isFlex)
    }
}

