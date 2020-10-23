//
//  CustomNode.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 15/10/20.
//

import Foundation
import AsyncDisplayKit

internal class CustomNode: ASDisplayNode {
    
    // MARK: UI Elements
    
    // MARK: Properties
    
    internal override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    internal override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
}
