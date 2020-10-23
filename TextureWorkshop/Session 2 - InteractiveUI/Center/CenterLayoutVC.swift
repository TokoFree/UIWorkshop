//
//  CenterLayoutVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class CenterLayoutVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let pinkBoxNode = BoxNode(color: .systemPink, size: CGSize(width: 150, height: 150), updateSizeText: true)
    
    // MARK: Properties
    
    private var centeringOptions: ASCenterLayoutSpecCenteringOptions = .XY
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
                
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            return ASCenterLayoutSpec(
                centeringOptions: self.centeringOptions,
                sizingOptions: .minimumXY,
                child: self.pinkBoxNode
            )
        }
    }
    
    // MARK: Functions
    
    internal func setCenteringOptions(_ val: ASCenterLayoutSpecCenteringOptions) {
        centeringOptions = val
        node.setNeedsLayout()
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

