//
//  ViewController.swift
//  TextureWorkshop
//
//  Created by Jefferson Setiawan on 06/10/20.
//

import UIKit

internal enum Route: String {
    case basicUIKit = "Basic UIKit"
    case basicTexture = "Basic Texture"
    case createProductCard = "Create Product Card"
    case interactiveLayout = "ASLayoutSpec - Interactive"
    case uiKitDemo = "UIKit Demo"
    case productCardVC = "Product Card VC"
}

internal final class ViewController: UIViewController {
    private let tableView = UITableView()

    private let routes: [Route] = [
        // UIKit vs Texture
        .basicUIKit,
        .basicTexture,
        
        // Interactive ASLayoutSpec
        .interactiveLayout,
        
        // Create Product Card
        .createProductCard,
        .productCardVC,
        
        //
        .uiKitDemo
    ]

    internal init() {
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        view.addSubview(tableView)
        title = "Texture Workshop"

        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorInset = .zero
    }
}

extension ViewController: UITableViewDelegate {
    internal func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)

        let selectedRoute = routes[indexPath.row]
        switch selectedRoute {
        case .basicUIKit:
            let viewController = BasicUIKitViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case .basicTexture:
            let viewController = BasicTextureViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case .createProductCard:
            let viewController = CreateProductCardViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case .interactiveLayout:
            let viewController = InteractiveListVC()
            navigationController?.pushViewController(viewController, animated: true)
        case .uiKitDemo:
            let vc = UIKitDemoViewController(nibName: "UIKitDemoViewController", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        case .productCardVC:
            let vc = ProductCardViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    internal func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return routes.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = routes[indexPath.row].rawValue
        return cell
    }
}
