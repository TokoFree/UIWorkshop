//
//  ProductCardFinalCellNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class ProductCardFinalNode: ASCellNode {
    let imageNode: ProductCardImageFinalNode
    let descriptionNode: ProductCardDescriptionFinalNode
    
    init(model: Product) {
        imageNode = ProductCardImageFinalNode(imageURL: model.imageURL)
        
        descriptionNode = ProductCardDescriptionFinalNode(description: model.description)
        descriptionNode.style.flexGrow = 1
        descriptionNode.style.flexShrink = 1
        
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        clipsToBounds = false
        
        setShadow()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [imageNode, descriptionNode]
        )
        
        let mainInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            child: mainStack
        )
        
        return mainInset
    }
    
    func setShadow() {
        cornerRadius = 8
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.12
        shadowOffset.height = 2
        shadowRadius = 4
    }
    
    override func layout() {
        super.layout()
        // Optimize performance for rendering shadow
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}

