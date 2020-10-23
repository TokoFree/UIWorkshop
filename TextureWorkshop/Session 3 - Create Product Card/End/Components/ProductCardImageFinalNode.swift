//
//  ProductCardImageFinalNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 10/10/20.
//

import AsyncDisplayKit

class ProductCardImageFinalNode: ASDisplayNode {
    let imageNode: ASNetworkImageNode
    let wishlistNode: ProductCardWishlistFinalNode
    
    init(imageURL: URL?) {
        imageNode = ASNetworkImageNode()
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
        imageNode.url = imageURL
        imageNode.cornerRadius = 6
        
        wishlistNode = ProductCardWishlistFinalNode()
        
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wishlistInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 4, left: 4, bottom: .infinity, right: .infinity),
            child: wishlistNode
        )
        
        return ASOverlayLayoutSpec(child: imageNode, overlay: wishlistInset)
    }
}
