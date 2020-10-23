//
//  Product.swift
//  TextureWorkshop
//
//  Created by Kensen on 10/10/20.
//

import UIKit

struct Product {
    let imageURL: URL?
    let description: Description
    
    struct Description {
        let name: String
        let price: String
        let shop: Shop
        let review: Review
        let isFreeShipping: Bool
        
        struct Review {
            let rating: Int
            let reviewCount: Int
        }
        
        struct Shop {
            let name: String
            let type: ShopType
            
            enum ShopType {
                case powerMerchant
                case officialStore
                case none
            }
        }
    }
}

let sampleProducts: [Product] = [
    Product(
        imageURL: URL(string: "https://picsum.photos/id/238/200/300"),
        description: Product.Description(
            name: "Minimum Product Card",
            price: "Rp100.000",
            shop: Product.Description.Shop(name: "Shop Name", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: false
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/239/200/300"),
        description: Product.Description(
            name: "Maximum Product Card That Has A Very Long Name That Will Not Fit In The Container",
            price: "Rp100.000",
            shop: Product.Description.Shop(name: "Also Has A Very Long Shop Name That Will Not Fit In The Container", type: .officialStore),
            review: Product.Description.Review(rating: 3, reviewCount: 100),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/240/200/300"),
        description: Product.Description(
            name: "Wingko Babat",
            price: "Rp10.000",
            shop: Product.Description.Shop(name: "Bandung Barat Shop", type: .none),
            review: Product.Description.Review(rating: 2, reviewCount: 1),
            isFreeShipping: false
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/241/200/300"),
        description: Product.Description(
            name: "Joycon",
            price: "Rp500.000",
            shop: Product.Description.Shop(name: "Cimahi Shop", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/242/200/300"),
        description: Product.Description(
            name: "Wingko Babat",
            price: "Rp10.000",
            shop: Product.Description.Shop(name: "Bandung Barat Shop", type: .none),
            review: Product.Description.Review(rating: 2, reviewCount: 1),
            isFreeShipping: false
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/243/200/300"),
        description: Product.Description(
            name: "Maximum Product Card That Has A Very Long Name",
            price: "Rp100.000",
            shop: Product.Description.Shop(name: "Also Has A Very Long Shop Name", type: .officialStore),
            review: Product.Description.Review(rating: 3, reviewCount: 100),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/244/200/300"),
        description: Product.Description(
            name: "Minimum Product Card",
            price: "Rp100.000",
            shop: Product.Description.Shop(name: "Shop Name", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: false
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/261 /200/300"),
        description: Product.Description(
            name: "Joycon",
            price: "Rp500.000",
            shop: Product.Description.Shop(name: "Cimahi Shop", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/260/200/300"),
        description: Product.Description(
            name: "Joycon",
            price: "Rp500.000",
            shop: Product.Description.Shop(name: "Cimahi Shop", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/247/200/300"),
        description: Product.Description(
            name: "Wingko Babat",
            price: "Rp10.000",
            shop: Product.Description.Shop(name: "Bandung Barat Shop", type: .none),
            review: Product.Description.Review(rating: 2, reviewCount: 1),
            isFreeShipping: false
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/248/200/300"),
        description: Product.Description(
            name: "Wingko Babat",
            price: "Rp10.000",
            shop: Product.Description.Shop(name: "Bandung Barat Shop", type: .none),
            review: Product.Description.Review(rating: 2, reviewCount: 1),
            isFreeShipping: false
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/249/200/300"),
        description: Product.Description(
            name: "Minimum Product Card",
            price: "Rp100.000",
            shop: Product.Description.Shop(name: "Shop Name", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: false
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/250/200/300"),
        description: Product.Description(
            name: "Joycon",
            price: "Rp500.000",
            shop: Product.Description.Shop(name: "Cimahi Shop", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/251/200/300"),
        description: Product.Description(
            name: "Joycon",
            price: "Rp500.000",
            shop: Product.Description.Shop(name: "Cimahi Shop", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/252/200/300"),
        description: Product.Description(
            name: "Joycon",
            price: "Rp500.000",
            shop: Product.Description.Shop(name: "Cimahi Shop", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/253/200/300"),
        description: Product.Description(
            name: "Joycon",
            price: "Rp500.000",
            shop: Product.Description.Shop(name: "Cimahi Shop", type: .none),
            review: Product.Description.Review(rating: 0, reviewCount: 0),
            isFreeShipping: true
        )
    ),
    Product(
        imageURL: URL(string: "https://picsum.photos/id/254/200/300"),
        description: Product.Description(
            name: "Wingko Babat",
            price: "Rp10.000",
            shop: Product.Description.Shop(name: "Bandung Barat Shop", type: .none),
            review: Product.Description.Review(rating: 2, reviewCount: 1),
            isFreeShipping: false
        )
    ),
]
