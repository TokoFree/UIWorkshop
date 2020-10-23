//
//  BasicTextureFinishedViewController.swift
//  TextureWorkshop
//
//  Created by Ambar Septian on 14/10/20.
//

import AsyncDisplayKit

class BasicTextureFinishedViewController: ASDKViewController<ASDisplayNode> {
    override init() {
        let rootNode = ASDisplayNode()
        super.init(node: rootNode)
        rootNode.backgroundColor = .white
        
        let subNode = ASDisplayNode()
        subNode.backgroundColor = .orange
        subNode.style.preferredSize = CGSize(width: 300, height: 300)

        rootNode.automaticallyManagesSubnodes = true
        rootNode.layoutSpecBlock = { _, _ in
            ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: [], child: subNode)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
