//
//  ProductCardWishlistFinalNode.swift
//  TextureWorkshop
//
//  Created by Kensen on 10/10/20.
//

import AsyncDisplayKit

class ProductCardWishlistFinalNode: ASDisplayNode {
    let backgroundNode: ASDisplayNode
    let activeNode: ASImageNode
    let inactiveNode: ASImageNode
    
    var isWishlist = false
    
    override init() {
        backgroundNode = ASDisplayNode()
        backgroundNode.backgroundColor = .lightGray
        backgroundNode.cornerRadius = 14
        
        activeNode = ASImageNode()
        activeNode.style.preferredSize = CGSize(width: 24, height: 24)
        activeNode.image = #imageLiteral(resourceName: "active_heart")
        
        inactiveNode = ASImageNode()
        inactiveNode.style.preferredSize = CGSize(width: 24, height: 24)
        inactiveNode.image = #imageLiteral(resourceName: "inactive_heart")
        
        super.init()
        automaticallyManagesSubnodes = true
        
        activeNode.addTarget(self, action: #selector(unwishlist), forControlEvents: .touchUpInside)
        inactiveNode.addTarget(self, action: #selector(wishlist), forControlEvents: .touchUpInside)
    }
    
    @objc func wishlist() {
        isWishlist = true
        setNeedsLayout()
    }
    
    @objc func unwishlist() {
        isWishlist = false
        setNeedsLayout()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let wishlistInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2),
            child: isWishlist ? activeNode : inactiveNode
        )
        
        return ASBackgroundLayoutSpec(
            child: wishlistInset,
            background: backgroundNode
        )
    }
}
