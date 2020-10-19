//
//  ViewController.swift
//  TextureWorkshop
//
//  Created by Jefferson Setiawan on 06/10/20.
//

import UIKit

internal enum Route: String {
    case lesson1 = "Lesson 1"
}

internal final class ViewController: UIViewController {
    private let tableView = UITableView()

    private let routes: [Route] = [.lesson1]

    internal init() {
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
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
        case .lesson1:
            let viewController = Lesson1VC()
            navigationController?.pushViewController(viewController, animated: true)
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
