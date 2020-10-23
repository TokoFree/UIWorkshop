//
//  ProductCardShopFinalNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 10/10/20.
//

import AsyncDisplayKit

class ProductCardShopFinalNode: ASDisplayNode {
    let badgeNode: ASImageNode?
    let nameNode: ASTextNode
    
    init(shop: Product.Description.Shop) {
        switch shop.type {
        case .powerMerchant:
            badgeNode = ASImageNode()
            badgeNode?.image = #imageLiteral(resourceName: "power_merchant")
        case .officialStore:
            badgeNode = ASImageNode()
            badgeNode?.image = #imageLiteral(resourceName: "official_store")
        case .none:
            badgeNode = nil
        }
        
        badgeNode?.style.preferredSize = CGSize(width: 16, height: 16)
        
        nameNode = ASTextNode()
        nameNode.attributedText = NSAttributedString(
            string: shop.name,
            attributes: [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.darkGray
            ]
        )
        nameNode.maximumNumberOfLines = 1
        nameNode.style.flexShrink = 1
        nameNode.truncationMode = .byTruncatingTail
        
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 4,
            justifyContent: .start,
            alignItems: .center,
            children: [badgeNode, nameNode].compactMap { $0 }
        )
    }
}
