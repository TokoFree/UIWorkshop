//
//  UIKitDemoViewController.swift
//  TextureWorkshop
//
//  Created by Ahmad Nabili on 10/10/20.
//

import UIKit

class UIKitDemoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var offscreenCells = Dictionary<Int, UICollectionViewCell>()
    private var products = sampleProducts

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: ProductCardWishlistTableViewCell.reusableIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: ProductCardWishlistTableViewCell.reusableIdentifier)
        tableView.dataSource = self
    }
}

extension UIKitDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCardWishlistTableViewCell.reusableIdentifier, for: indexPath)
        
        if let productCell = cell as? ProductCardWishlistTableViewCell {
            productCell.product = products[indexPath.row]
        }
        
        return cell
    }
}
