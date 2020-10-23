//
//  Exercise1p2CheatVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 17/10/20.
//

import Foundation
import AsyncDisplayKit

internal class Exercise2CheatVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.style.preferredSize = CGSize(width: 80, height: 80)
        node.image = UIImage(named: "product")
        return node
    }()
    
    private let titleTextNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "Title Lorem Ipsum")
        return node
    }()
    
    private let subtitleTextNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "Subtitle text.. lalala")
        return node
    }()
    
    private let backgroundNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        return node
    }()
    
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            
            let textStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 4,
                justifyContent: .start,
                alignItems: .start,
                children: [self.titleTextNode, self.subtitleTextNode]
            )
            
            let finalStack = ASStackLayoutSpec(
                direction: .horizontal,
                spacing: 8,
                justifyContent: .start,
                alignItems: .center,
                children: [self.imageNode, textStack]
            )
            
            let background = ASBackgroundLayoutSpec(
                child: finalStack,
                background: self.backgroundNode
            )
            
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(
                    top: 16,
                    left: 16,
                    bottom: .infinity,
                    right: .infinity
                ),
                child: background
            )
        }
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

