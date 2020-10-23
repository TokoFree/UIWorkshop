//
//  ProductCardWishlistTableViewCell.swift
//  TextureWorkshop
//
//  Created by Ahmad Nabili on 13/10/20.
//

import UIKit

class ProductCardWishlistTableViewCell: UITableViewCell {
    static let reusableIdentifier = String(describing: ProductCardWishlistTableViewCell.self)
    
    // MARK: View Outlets
    
    @IBOutlet weak var shadowWrapperView: UIView!
    @IBOutlet weak var contentWrapperView: UIView!
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var shopBadgeImage: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var totalRatersLabel: UILabel!
    @IBOutlet weak var freeShippingImage: UIImageView!
    
    // MARK: Constraint Outlets
    
    // shopBadge-related constraint
    @IBOutlet var shopBadgeWidthConstraint: NSLayoutConstraint!
    @IBOutlet var shopBadgeGap: NSLayoutConstraint!
    // shopName-related constraint
    @IBOutlet var shopNameGapToTotalRaters: NSLayoutConstraint!
    @IBOutlet var shopNameGapToFreeShipping: NSLayoutConstraint!
    @IBOutlet var shopNameGapToSuperview: NSLayoutConstraint!
    // rating-related constraint
    @IBOutlet var totalRatersGapToSuperview: NSLayoutConstraint!
    @IBOutlet var totalRatersGapToFreeShipping: NSLayoutConstraint!
    // freeShippingImage-related constraint
    @IBOutlet var freeShippingGapToSuperview: NSLayoutConstraint!
    
    // MARK: Variable
    
    var product: Product? {
        didSet {
            refreshUi()
        }
    }
    
    // Optimize performance for rendering shadow
    /*
    override var frame: CGRect {
        didSet {
            guard let shadowWrapperView = shadowWrapperView, self.frame != oldValue else { return }
            shadowWrapperView.layer.shadowPath = UIBezierPath(rect: shadowWrapperView.bounds).cgPath
        }
    }*/
    
    // MARK: Cell-Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    // MARK: Other Purposes
    
    private func setupView() {
        shadowWrapperView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowWrapperView.layer.shadowRadius = 4
        shadowWrapperView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowWrapperView.layer.shadowOpacity = 0.12
        shadowWrapperView.layer.cornerRadius = 8
        
        productImage.layer.cornerRadius = 6
        
        wishlistButton.layer.cornerRadius = wishlistButton.frame.height/2
        wishlistButton.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        wishlistButton.layer.borderWidth = 0.5
        
        wishlistButton.addTarget(self, action: #selector(onWishlistButtonTap), for: .touchUpInside)
    }
    
    @objc private func onWishlistButtonTap() {
        wishlistButton.isSelected.toggle()
    }
    
    private func refreshUi() {
        productNameLabel.text = product?.description.name ?? ""
        productPriceLabel.text = product?.description.price ?? ""
        shopNameLabel.text = product?.description.shop.name
        ratingView.rating = product?.description.review.rating ?? 0
        totalRatersLabel.text = "(\(product?.description.review.reviewCount ?? 0))"
        loadImage(imageURL: product?.imageURL)
        
        
        /* === #1 Hiding shop badge ===
         
         In each `case` we can enable `showShopBadge(with:)` or `hideShopBadge()`
         and disable another code.
         
         `showShopBadge(with:)` and `hideShopBadge()` basically maintain ui-hiding
         by managing constraint's constant value (width constraint and space constraint).
         */
        
        switch product?.description.shop.type {
        case .officialStore:
            shopBadgeImage.isHidden = false
            shopBadgeImage.image = UIImage(named: "official_store")
            // showShopBadge(with: UIImage(named: "official_store"))
            
        case .powerMerchant:
            shopBadgeImage.isHidden = false
            shopBadgeImage.image = UIImage(named: "power_merchant")
            // showShopBadge(with: UIImage(named: "power_merchant"))
            
        default:
            shopBadgeImage.isHidden = true
            // hideShopBadge()
        }
        
        
        /* === #2 Extra Cases: Hiding both rating bar and free shipping === */
        
        let totalRaters = product?.description.review.reviewCount ?? 0
        let isFreeShipping = product?.description.isFreeShipping == true
        
        // disable these codes
        ratingView.isHidden = totalRaters <= 0
        totalRatersLabel.isHidden = totalRaters <= 0
        freeShippingImage.isHidden = !isFreeShipping
        
        /*
        And we can enable these codes below.
         
        Basically, these codes will maintain ui-hiding, by managing constraint's
         `isActive` value to enable or disable it.
         
         In this case, we need to be carefully maintain these constraints. Otherwise,
         it can be broken and have glitch on the ui.
        */
        
        /*
        if totalRaters > 0 && isFreeShipping {
            ratingView.isHidden = false
            totalRatersLabel.isHidden = false
            freeShippingImage.isHidden = false
            
            shopNameGapToSuperview.isActive = false
            shopNameGapToFreeShipping.isActive = false
            totalRatersGapToSuperview.isActive = false
            shopNameGapToTotalRaters.isActive = true
            totalRatersGapToFreeShipping.isActive = true
            freeShippingGapToSuperview.isActive = true
            
        } else if totalRaters <= 0 && isFreeShipping {
            ratingView.isHidden = true
            totalRatersLabel.isHidden = true
            freeShippingImage.isHidden = false
            
            shopNameGapToSuperview.isActive = false
            shopNameGapToTotalRaters.isActive = false
            totalRatersGapToSuperview.isActive = false
            totalRatersGapToFreeShipping.isActive = false
            shopNameGapToFreeShipping.isActive = true
            freeShippingGapToSuperview.isActive = true
         
        } else if totalRaters > 0 && !isFreeShipping {
            ratingView.isHidden = false
            totalRatersLabel.isHidden = false
            freeShippingImage.isHidden = true
            
            shopNameGapToSuperview.isActive = false
            shopNameGapToFreeShipping.isActive = false
            totalRatersGapToFreeShipping.isActive = false
            freeShippingGapToSuperview.isActive = false
            shopNameGapToTotalRaters.isActive = true
            totalRatersGapToSuperview.isActive = true
         
        } else {
            ratingView.isHidden = true
            totalRatersLabel.isHidden = true
            freeShippingImage.isHidden = true
            
            shopNameGapToTotalRaters.isActive = false
            shopNameGapToFreeShipping.isActive = false
            totalRatersGapToSuperview.isActive = false
            totalRatersGapToFreeShipping.isActive = false
            freeShippingGapToSuperview.isActive = false
            shopNameGapToSuperview.isActive = true
        }
 */
    }
    
    private func hideShopBadge() {
        shopBadgeImage.isHidden = true
        shopBadgeWidthConstraint.constant = 0
        shopBadgeGap.constant = 0
    }
    
    private func showShopBadge(with image: UIImage?) {
        shopBadgeImage.isHidden = false
        shopBadgeImage.image = image
        shopBadgeWidthConstraint.constant = 16
        shopBadgeGap.constant = 4
    }
    
    private func loadImage(imageURL: URL?) {
        guard let url = imageURL else { return }
        // reset the image
        productImage.image = nil

        // move to background thread
        DispatchQueue.global(qos: .default).async {
            // do some task
            guard let imageData = try? Data(contentsOf: url) else { return }
            // move to main thread
            DispatchQueue.main.async {
                // update some UI
                let image = UIImage(data: imageData)
                self.productImage.image = image
            }
        }
    }
}
