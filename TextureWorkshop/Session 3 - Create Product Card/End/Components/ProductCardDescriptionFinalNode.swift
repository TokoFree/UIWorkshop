//
//  ProductCardDescriptionFinalNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 10/10/20.
//

import AsyncDisplayKit

class ProductCardDescriptionFinalNode: ASDisplayNode {
    let nameNode: ASTextNode
    let priceNode: ASTextNode
    let shopNode: ProductCardShopFinalNode
    let reviewNode: ProductCardReviewFinalNode?
    let freeShippingNode: ASImageNode?
    
    init(description: Product.Description) {
        nameNode = ASTextNode()
        nameNode.attributedText = NSAttributedString(
            string: description.name,
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)
            ]
        )
        nameNode.maximumNumberOfLines = 2
        
        priceNode = ASTextNode()
        priceNode.attributedText = NSAttributedString(
            string: description.price,
            attributes: [
                .font: UIFont.systemFont(ofSize: 14, weight: .bold)
            ]
        )
        priceNode.maximumNumberOfLines = 1
        
        shopNode = ProductCardShopFinalNode(shop: description.shop)
        reviewNode = description.review.reviewCount > 0 ? ProductCardReviewFinalNode(review: description.review) : nil
        
        freeShippingNode = description.isFreeShipping ? ASImageNode() : nil
        freeShippingNode?.image = #imageLiteral(resourceName: "free_shipping")
        freeShippingNode?.style.preferredSize = CGSize(width: 67, height: 16)
        freeShippingNode?.style.spacingBefore = 4
        
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .start,
            alignItems: .stretch,
            children: [
                nameNode,
                priceNode,
                shopNode,
                reviewNode,
                freeShippingNode
            ].compactMap { $0 }
        )
    }
}
