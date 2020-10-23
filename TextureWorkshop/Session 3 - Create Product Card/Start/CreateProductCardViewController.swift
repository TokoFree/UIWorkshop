//
//  CreateProductCardViewController.swift
//  TextureWorkshop
//
//  Created by Kensen on 14/10/20.
//

import AsyncDisplayKit

class CreateProductCardViewController: ASDKViewController<ASDisplayNode> {
    let product = Product(
        imageURL: URL(string:"https://ecs7-p.tokopedia.net/img/cache/200-square/product-1/2020/3/25/6322231/6322231_6706ca49-2030-49a5-b719-24eb61a519a7_684_684.jpg"),
        description: Product.Description(
            name: "Product Name",
            price: "Rp100.000",
            shop: Product.Description.Shop(
                name: "Shop Name",
                type: .officialStore
            ),
            review: Product.Description.Review(
                rating: 4,
                reviewCount: 100
            ),
            isFreeShipping: true
        )
    )
    
    override init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.backgroundColor = .white
        
        let productCardNode = ProductCardNode(model: product)
        
        node.layoutSpecBlock = { _, _ in
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 8, left: 8, bottom: .infinity, right: 8),
                child: productCardNode
            )
        }
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Expected", style: .plain, target: self, action: #selector(goToExpectedViewController)), animated: false)
    }
    
    @objc func goToExpectedViewController() {
        let expectedViewController = CreateProductCardFinalViewController(product: product)
        navigationController?.pushViewController(expectedViewController, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

