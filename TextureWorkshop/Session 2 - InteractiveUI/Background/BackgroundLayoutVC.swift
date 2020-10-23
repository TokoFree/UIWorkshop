//
//  BackgroundLayoutVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 14/10/20.
//

import Foundation
import AsyncDisplayKit

internal class BackgroundLayoutVC: ASDKViewController<ASDisplayNode> {
    
    // MARK: UI Elements
    
    private let backgroundNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.backgroundColor = UIColor.cyan.withAlphaComponent(0.2)
        return node
    }()
    
    private let textNode = ASTextNode2()
    
    // MARK: Properties
    
    private var textType: TextType = .medium
    private let paragraph: String = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


    """
        
    // MARK: Initialization
    
    internal override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
                
        node.layoutSpecBlock = { [weak self] _, size -> ASLayoutSpec in
            guard let self = self else { return ASLayoutSpec() }
            let background = ASBackgroundLayoutSpec(child: self.textNode, background: self.backgroundNode)
            return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: background)
        }
    }
    
    // MARK: Functions
    
    internal func setTextType(type: TextType) {
        let text: String
        switch type {
        case .short: text = paragraph
        case .medium: text = paragraph + paragraph
        case .long: text = paragraph + paragraph + paragraph
        }
        textNode.attributedText = NSAttributedString(string: text)
    }
    
    internal func setOpacity(val: CGFloat) {
        backgroundNode.backgroundColor = UIColor.cyan.withAlphaComponent(val)
    }
    
    // MARK: Required Init
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
