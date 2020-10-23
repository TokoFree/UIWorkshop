# Session 3 - Create a List of Product Cards

This session breaks down the process of creating a component using `Texture`.

## Product Card

`Product Card` is one of the most used components in `Tokopedia App`. It is used to represent the description of a product. However, every product has different amount of information. Thus, the presentation of each `Product Card` may vary.

## Expectation

After this session, you are expected to learn three things using `Texture`:


#### A. How to create a dynamic component

As stated earlier, not every `Product Card` displays the same amount of information. This session shows how to create a `Product Card` based on the information provided.

#### B. How to show a list of components

This session shows how to display a collection of products using `List` format.

#### C. How to perform a live update on a component

This session shows how easy it is to update the UI of a `Texture` component.

## Table of Contents

[A. Open ProductCardNode.swift](#a-open-productcardstartproductcardnode)

[B. Start Small](#b-start-small)

[C. Create Shop Row](#c-create-shop-row)

[D. Create Review Row](#d-create-review-row)

[E. Create Free Shipping Row](#e-create-free-shipping-row)

[F. Add Wishlist](#f-add-wishlist)

[G. Summary](#f-summary)

[H. Move ProductCard to Lists](#move-productcard-to-lists)

[I. Create Live Update on Component](#create-live-update-on-component)

## Creating a Product Card

This session is covered in the folder labelled as `Session 3 - Create Product Card`

Before we start, to have a better picture on what we are going to create, do the followings. 
1. Run the project
2. Tap on `Create Product Card`.
3. Then, tap on `Expected`

Also, take a look at the information model.
1. Go back to Xcode
2. Open `Product.swift`

Now, let's start!

#### A. Open `Start/ProductCardNode.swift`

This is the main class of the Product Card component.

#### B. Start Small

Let's put product image, name and price first.

1. Add the nodes as properties
    ```swift
    let imageNode = ASNetworkImageNode()
    let nameNode = ASTextNode()
    let priceNode = ASTextNode()
    ```

2. Setup the nodes
    ```swift
    imageNode.url = model.imageUrl
    imageNode.style.preferredSize = CGSize(width: 80, height: 80)
    
    nameNode.attributedText = NSAttributedString(
        string: description.name,
        attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)
        ]
    )

    priceNode.attributedText = NSAttributedString(
        string: description.price,
        attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ]
    )
    ```

3. Arrange it in `LayoutSpecThatFits`
    ```swift
    let verticalStack = ASStackLayoutSpec(
        direction: .vertical,
        spacing: 10,
        justifyContent: .start,
        alignItems: .start,
        children: [
            nameNode,
            priceNode
        ]
    )
    
    let mainStack = ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 8,
        justifyContent: .start,
        alignItems: .start,
        children: [
            imageNode,
            verticalStack
        ]
    )
    
    let mainInset = ASInsetLayoutSpec(
        insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
        child: mainStack
    )
    
    return mainInset
    ```

4. Add this node into `Start/ProductCardNode.swift`
    ```swift
    let descriptionNode: ProductCardDescriptionNode
    ```
    ```swift
    descriptionNode = ProductCardDescriptionNode(description: model.description)
    ```
    ```swift
    let mainStack = ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 8,
        justifyContent: .start,
        alignItems: .start,
        children: [
            imageNode,
            descriptionNode
        ]
    )
    ```
5. Run the project and see the result

#### C. Create Shop Row

Before we continue, it is better to refactor the right hand side of the `Product Card` into a new class. Else, we might have a bloated code like this.

```swift
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let shopStack = ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 4,
        justifyContent: .start,
        alignItems: .start,
        children: [
            badgeNode,
            nameNode
        ]
    )
    
    let verticalStack = ASStackLayoutSpec(
        direction: .vertical,
        spacing: 10,
        justifyContent: .start,
        alignItems: .start,
        children: [
            nameNode,
            priceNode,
            shopNode
        ]
    )
    
    let mainStack = ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 8,
        justifyContent: .start,
        alignItems: .start,
        children: [
            imageNode,
            verticalStack
        ]
    )
    
    let mainInset = ASInsetLayoutSpec(
        insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
        child: mainStack
    )
    
    return mainInset
}
```

So, let's move the vertical stack

1. Cut this
    ```swift
    let nameNode = ASTextNode()
    let priceNode = ASTextNode()
    ```

2. This
    ```swift
    nameNode.attributedText = NSAttributedString(
        string: description.name,
        attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular)
        ]
    )
    
    priceNode.attributedText = NSAttributedString(
        string: description.price,
        attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ]
    )
    ```

3. And This
    ```swift
    let verticalStack = ASStackLayoutSpec(
        direction: .vertical,
        spacing: 10,
        justifyContent: .start,
        alignItems: .start,
        children: [
            nameNode,
            priceNode
        ]
    )
    ```

4. Then paste it to `Start/Components/ProductCardDescriptionNode.swift`

> Phew, now that we got that out of the way, let's... WAIT! One more thing. This shop row is a bit different from name row and price row, because the badge may or may not be displayed based on the shop type.

> Please take a look at `Start/CreateProductCardViewController.swift`. That is the data that we will feed into the product card. Let's change the shop type from `.officialStore` to `.none`. After that, run the project again and take a look at the expected `Product Card`. Something is missing...

Okay now, let's continue :).

1. Open `Start/Components/ProductCardShopNode`
    We will create the shop row here

2. Add the nodes as properties
    ```swift
    let badgeNode: ASImageNode?
    let nameNode = ASTextNode()
    ```
    You might notice the optional, what is that for? Well, remember that the badge can disappear?
    
3. Setup the nodes
    ```swift
    switch shop.type {
        case .officialStore:
            badgeNode = ASImageNode()
            badgeNode.image = UIImage(named: "official_store")
        case .powerMerchant:
            badgeNode = ASImageNode()
            badgeNode.image = UIImage(named: "power_merchant")
        case .none:
            badgeNode = nil
    }
    
    badgeNode?.style.preferredSize = CGSize(width: 16, height: 16)
    
    nameNode.attributedText = NSAttributedString(
        string: shop.name,
        attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .regular),
            .foregroundColor: UIColor.darkGray
        ]
    )
    ```

4. Arrange it in `LayoutSpecThatFits`
    ```swift
    return ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 4,
        justifyContent: .start,
        alignItems: .start,
        children: [badgeNode, nameNode]
    )
    ```
    
    Oh no, there is an error! The reason is that `children` expects `[ASLayoutElement]` not `[ASLayoutElement?]`. What do we do? We may define a `children` property before adding it into the stack.
    ```swift
    let children: [ASLayoutElement]
    if let badgeNode = badgeNode { // safe unwrap
        children = [badgeNode, nameNode]
    } else {
        children = [nameNode]
    }
    
    return ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 4,
        justifyContent: .start,
        alignItems: .start,
        children: children
    )
    ```

    Or we can take advantage of Swift's High Order Function `compactMap`.
    ```swift
    return ASStackLayoutSpec(
        direction: .horizontal,
        spacing: 4,
        justifyContent: .start,
        alignItems: .start,
        children: [badgeNode, nameNode].compactMap { $0 }
    )
    ```
    
    Basically, `compactMap` filters all nil values out of a collection.

5. Add this node into `Start/Components/ProductCardDescriptionNode.swift`
    ```swift
    let shopNode: ProductCardShopNode
    ```
    ```swift
    shopNode = ProductCardShopNode(shop: description.shop)
    ```
    ```swift
    return ASStackLayoutSpec(
        direction: .vertical,
        spacing: 10,
        justifyContent: .start,
        alignItems: .start,
        children: [
            nameNode,
            priceNode,
            shopNode
        ]
    )
    ```

6. Run the project and see the result

#### D. Create Review Row

One thing you might notice about this row is that the stars are stacked horizontally, and then the star stack is stacked again with review count text. This time, there is no need to move the star stack into a new class because the layout is relatively simple.

1. Open `Start/Components/ProductCardReviewNode.swift`
    We will create the review row here

2. Add the nodes as properties
    ```swift
    let starNodes: [ASImageNode]
    let reviewCountNode = ASTextNode()
    ```
    
3. Setup the nodes
    ```swift
    var tempStarNodes = [ASImageNode]()
    
    for index in 1...5 {
        let starNode = ASImageNode()
        starNode.image = UIImage(named: index >= review.rating ? "active_star" : "inactive_star")
        starNode.style.preferredSize = CGSize(width: 11, height: 11)
        tempStarNodes.append(starNode)
    }
    
    starNodes = tempStarNodes
    
    reviewCountNode.attributedText = NSAttributedString(
        string: "(\(review.reviewCount))",
        attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .regular),
            .foregroundColor: UIColor.gray
        ]
    )
    ```
    
4. Arrange it in `LayoutSpecThatFits`
    ```swift
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
    ```
    
5. Add this node into `Start/Components/ProductCardDescriptionNode.swift`
    ```swift
    let reviewNode: ProductCardReviewNode
    ```
    ```swift
    reviewNode = ProductCardReviewNode(review: description.review)
    ```
    ```swift
    return ASStackLayoutSpec(
        direction: .vertical,
        spacing: 10,
        justifyContent: .start,
        alignItems: .start,
        children: [
            nameNode,
            priceNode,
            shopNode,
            reviewNode
        ]
    )
    ```

6. Run the project and see the result

#### E. Create Free Shipping Row

This row is optional, as free shipping badge may only be shown if `isFreeShipping == true` (refer to `Start/CreateProductCardViewController.swift`). Also, this row only contains one image node so there is no need to create a new node class.

1. Add this node into `Start/ProductCardNode.swift`
    ```swift
    let freeShippingNode: ASImageNode?
    ```
    ```swift
    freeShippingNode = model.isFreeShipping? ASImageNode() : nil
    freeShippingNode?.image = UIImage(named: "free_shipping")
    freeShippingNode?.style.preferredSize = CGSize(width: 67, height: 16)
    ```
    ```swift
    return ASStackLayoutSpec(
        direction: .vertical,
        spacing: 10,
        justifyContent: .start,
        alignItems: .start,
        children: [
            nameNode,
            priceNode,
            shopNode,
            reviewNode,
            freeShippingNode
        ].compactMap { $0 }
    )
    ```
    
2. Run the project and see the result

3. What if we want to add more spacing between reviewNode and freeShippingNode?
    ```swift
    freeShippingNode?.style.spacingBefore = 4 // there is also spacing after if you need it
    ```
    
#### F. Add Wishlist

in this part, we will refactor the ImageNode to Class `ProductCardImageNode`, and we will attach a wishlist in the top corner(inside) of the image

1. Open `ProductCardNode.` 
2. move `imageNode` into `ProductCardImageNode`
 ```swift
  let imageNode: ASNetworkImageNode
  // in init
  imageNode = ASNetworkImageNode()
  imageNode.url = model.imageURL
  imageNode.style.preferredSize = CGSize(width: 80, height: 80)
  imageNode.cornerRadius = 6
  ```
  
3. Create layout for `ProductCardImageNode`
 ```swift
 let wishlistInset = ASInsetLayoutSpec(
   insets: UIEdgeInsets(top: 4, left: 4, bottom: .infinity, right: .infinity),
   child: wishlistNode
 )
  
 return ASOverlayLayoutSpec(child: imageNode, overlay: wishlistInset)
  ```
4. Now, the image should have a wishlist
     
#### G. Summary

Well, there you go. Easy, isn't it? In a nutshell, there are three steps to create a component using `Texture`:
1. Create properties of all nodes
2. Setup the nodes
3. Arrange it in `LayoutSpecThatFits.`

Now let's move on to the next step: `Creating a List of Product Card.`

#### H. Move ProductCard to Lists
In this part, we will show how to create lists using a Table node with auto height.
  
Next, we will create a `List of Product Card` using `TableNode.` 

1. Change `ProductCardNode` subclass to `ASCellNode`
2. Open `ProductCardStarterViewController`
3. Change the `ASDKViewController<ASDisplayNode>` generic to `ASDKViewController<ASTableNode>` and `super.init` to confirm with `ASTableNode`
3. For use `TableNode` we need `data source` to give information what data we will render 
 ```swift
  node.dataSource = self
  ```
 then we need to implement two method `numberOfRowsInSection` this method
 give the detail to how many data we will render and `nodeForRowAt` to give
 the information which cell will render
 ```
  extension ProductCardViewController: ASTableDataSource {
   func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return model.count
   }
   
   func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
    let data = model[indexPath.row]
    return ProductCardFinalNode(model: data)
   }
  }
  ```
4. Build and run the app now our `ProductCardList` seems good with different detail of height
 but we still find a separtor now we will delete it to delete it we need implement method 
 `viewDidLoad` because we will acess the `tableNode.view` 
 ```swift
  override func viewDidLoad() {
   super.viewDidLoad()
   node.view.separatorStyle = .none
  }
  ```

#### I. Create Live Update on Component

In this part, we will perform a live update component on wishlist refer to product card expected wishlist could toggle on and off.

1. Open `start/ProductCardWishlistNode`
2. add action to activeNode and inactiveNode
 ```swift
  activeNode.addTarget(self, action: #selector(changeWishlistState), forControlEvents: .touchUpInside)
  inactiveNode.addTarget(self, action: #selector(changeWishlistState), forControlEvents: .touchUpInside)
  ```
3. move to line create a new property to handle state wishlist
 ```swift
  var isWishlist = false
  ```
4. move to function `changeWishlistState` add toogle on and toogle off for wishlist
 ```swift
  @objc func changeWishlistState() { 
   // change the state vice versa 
   isWishlist = !isWishlist
   setNeedsLayout()
  }
  ```
 by calling `setNeedsLayout()` we trigger the `layoutSpecThatFits` to layout again.
5. move to `layoutSpecThatFits` this function will return an active node because we want to toggle on/off the wishlist so that we will add
 ```swift
  var child: ASImageNode
  
  if isWishlist {
   child = activeNode
  } else {
   child = inactiveNode
  }
  
  let wishlistInset = ASInsetLayoutSpec(
   insets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2),
   child: child
  )
  ```
6. Build and run 

In this part, you can see that our `lists of product cards` are working fine. You can `toggle the wishlist,` but we have an issue inset from our `product cards` won't work, so here is the challenge fixing the component inset. 
- clue: background and insets
- cheat: you can checkout branch `BeautyProductCard.`
