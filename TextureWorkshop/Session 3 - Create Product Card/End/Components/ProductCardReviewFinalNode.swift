//
//  ProductCardReviewFinalNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 10/10/20.
//

import AsyncDisplayKit

class ProductCardReviewFinalNode: ASDisplayNode {
    let starNodes: [ASImageNode]
    let reviewCountNode: ASTextNode
    
    init(review: Product.Description.Review) {
        starNodes = (0..<5).map { index in
            let starNode = ASImageNode()
            
            starNode.style.preferredSize = CGSize(width: 11, height: 11)
            starNode.image = index < review.rating ? #imageLiteral(resourceName: "active_star") : #imageLiteral(resourceName: "inactive_star")
            
            return starNode
        }
        
        reviewCountNode = ASTextNode()
        reviewCountNode.attributedText = NSAttributedString(
            string: "(\(review.reviewCount))",
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.gray
            ]
        )
        
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let starStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 1,
            justifyContent: .start,
            alignItems: .start,
            children: starNodes
        )
        
        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 2,
            justifyContent: .start,
            alignItems: .center,
            children: [starStack, reviewCountNode]
        )
        
        return mainStack
    }
}
