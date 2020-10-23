//
//  InsetLayoutVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 12/10/20.
//

import Foundation
import AsyncDisplayKit

internal class InsetLayoutVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let pinkBox = BoxNode(color: .systemPink, size: CGSize(width: 200, height: 150))
    
    // MARK: Properties
    
    private var insets: UIEdgeInsets = UIEdgeInsets(
        top: 0,
        left: 0,
        bottom: .infinity,
        right: .infinity
    )
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            return ASInsetLayoutSpec(insets: self.insets, child: self.pinkBox)
        }
    }
    
    // MARK: Functions
    
    internal func setInsets(side: InsetSide, value: CGFloat) {
        switch side {
        case .top: insets.top = value
        case .bottom: insets.bottom = value
        case .left: insets.left = value
        case .right: insets.right = value
        }
        
        node.setNeedsLayout()
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

