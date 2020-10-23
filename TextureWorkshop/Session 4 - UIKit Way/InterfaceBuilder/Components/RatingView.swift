//
//  RatingView.swift
//  TextureWorkshop
//
//  Created by Ahmad Nabili on 10/10/20.
//

import UIKit

class RatingView: UIView {
    @IBOutlet weak var stackView: UIStackView!
    
    var rating: Int = 3 {
        didSet {
            if rating > 5 {
                rating = 5
            } else if rating < 0 {
                rating  = 0
            }
            refreshRating()
        }
    }
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initFromNib()
        refreshRating()
    }
    
    private func initFromNib() {
        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.layoutIfNeeded()
        self.addSubview(view)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    // MARK: - Helpers
    
    private func setupView() {
        stackView.arrangedSubviews.forEach { view in
            view.layer.cornerRadius = view.frame.height/2
            view.layer.masksToBounds = true
        }
    }
    
    private func refreshRating() {
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            guard let imageView = view as? UIImageView else { continue }
            if index < rating {
                imageView.image = UIImage(named: "active_star")
            } else {
                imageView.image = UIImage(named: "inactive_star")
            }
        }
    }
}
