//
//  CreateProductCardFinalViewController.swift
//  TextureWorkshop
//
//  Created by Kensen on 08/10/20.
//

import AsyncDisplayKit

class CreateProductCardFinalViewController: ASDKViewController<ASDisplayNode> {
    init(product: Product) {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        let productCardNode = ProductCardFinalNode(model: product)
        
        node.layoutSpecBlock = { _, _ in
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 8, left: 8, bottom: .infinity, right: 8),
                child: productCardNode
            )
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
