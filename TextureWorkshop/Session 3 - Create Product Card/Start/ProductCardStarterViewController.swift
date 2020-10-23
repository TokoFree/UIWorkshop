//
//  ProductCardStarterViewController.swift
//  TextureWorkshop
//
//  Created by Benny Kurniawan on 21/10/20.
//

import AsyncDisplayKit

class ProductCardStarterViewController: ASDKViewController<ASDisplayNode> {
    let model = sampleProducts
    
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
