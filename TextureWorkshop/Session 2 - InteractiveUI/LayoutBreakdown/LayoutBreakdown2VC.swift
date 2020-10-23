//
//  LayoutBreakdown2VC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class LayoutBreakdown2VC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let pinkNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.preferredSize = CGSize(width: 80, height: 80)
        node.backgroundColor = .systemPink
        return node
    }()
    
    private let cyanNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.preferredSize = CGSize(width: 80, height: 80)
        node.backgroundColor = .cyan
        return node
    }()
    
    private let greenNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.preferredSize = CGSize(width: 100, height: 40)
        node.backgroundColor = .green
        return node
    }()
    
    private let purpleNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.preferredSize = CGSize(width: 100, height: 40)
        node.backgroundColor = .purple
        return node
    }()
    
    private let orangeNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.preferredSize = CGSize(width: 100, height: 40)
        node.backgroundColor = .orange
        return node
    }()
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            
            let topStack = ASStackLayoutSpec(
                direction: .horizontal,
                spacing: 16,
                justifyContent: .start,
                alignItems: .start,
                children: [self.pinkNode, self.cyanNode]
            )
            
            let bottomStack = ASStackLayoutSpec(
                direction: .horizontal,
                spacing: 16,
                justifyContent: .start,
                alignItems: .start,
                children: [self.greenNode, self.purpleNode, self.orangeNode]
            )
            
            let finalStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 16,
                justifyContent: .start,
                alignItems: .start,
                children: [topStack, bottomStack]
            )
            
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(
                    top: 16,
                    left: 16,
                    bottom: .infinity,
                    right: .infinity
                ),
                child: finalStack
            )
        }
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
