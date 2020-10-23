//
//  InteractiveListVC.swift
//  TextureWorkshop
//
//  Created by Steven Muliamin on 13/10/20.
//

import UIKit

internal enum InteractiveRoute: String {
    // LayoutSpec
    case wrapper = "1. ASWrapperLayoutSpec"
    case inset = "2. ASInsetLayoutSpec"
    case stack = "3. ASStackLayoutSpec"
    case stackGrow = "4. ASStackLayoutSpec + FlexGrow"
    case stackShrink = "5. ASStackLayoutSpec + FlexShrink"
    case center = "6. ASCenterLayoutSpec"
    case background = "7. ASBackgroundLayoutSpec"
    case overlay = "8. ASOverlayLayoutSpec"
    
    // Layout Breakdown
    case breakdown1 = "**  Layout Breakdown 1"
    case breakdown2 = "**  Layout Breakdown 2"
    
    // Exercise
    case exercise1 = "**  Exercise 1 - Stack"
    case exercise2 = "**  Exercise 2 - Background"
    case exercise3 = "**  Exercise 3 - Custom ASDisplayNode"
}

internal final class InteractiveListVC: UIViewController {
    private let tableView = UITableView()

    private let routes: [InteractiveRoute] = [
        // show examples of layouts until stack + flexShrink
        .wrapper,
        .inset,
        .stack,
        
        // show layout breakdown 1 & 2
        // show that LayoutSpec can take another LayoutSpec as `child` argument
        // which enables the audience to combine and construct specific layouts
        .breakdown1,
        .breakdown2,
        
        // exercise 1 - combine 2 stacks
        .exercise1,
        
        // stack + flexGrow & flexShrink
        .stackGrow,
        .stackShrink,
                
        // show examples of layout until overlay -- * QUICK SESSION *
        .center,
        .background,
        .overlay,
                
        // exercise 2 - continue from ex. 1, add background & edit inset
        .exercise2,
        
        // exercise 3 - extract the layout to `CustomNode`
        // instantiate `CustomNode` instead of many elements and only use the `CustomNode` in the LayoutSpec
        // achieve the same result as ex. 2 by creating a `CustomNode` of `ASDisplayNode` type
        .exercise3
    ]
    
    private var flag = false

    internal init() {
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Interactive Layouts"

        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorInset = .zero
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if flag == false {
            tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            flag.toggle()
        }
    }
}

extension InteractiveListVC: UITableViewDelegate {
    internal func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)

        let selectedRoute = routes[indexPath.row]
        
        switch selectedRoute {
        case .wrapper:
            let viewController = WrapperLayoutVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .inset:
            let viewController = InsetLayoutVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .stack:
            let viewController = StackLayoutVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .stackGrow:
            let viewController = StackLayoutGrowVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .stackShrink:
            let viewController = StackLayoutShrinkVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .center:
            let viewController = CenterLayoutVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .background:
            let viewController = BackgroundLayoutVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .overlay:
            let viewController = OverlayLayoutVCInteractive()
            navigationController?.pushViewController(viewController, animated: true)
        case .breakdown1:
            let viewController = LayoutBreakdown1VC()
            navigationController?.pushViewController(viewController, animated: true)
        case .breakdown2:
            let viewController = LayoutBreakdown2VC()
            navigationController?.pushViewController(viewController, animated: true)
        case .exercise1:
            let viewController = LayoutExercise1VC()
            navigationController?.pushViewController(viewController, animated: true)
        case .exercise2:
            let viewController = LayoutExercise2VC()
            navigationController?.pushViewController(viewController, animated: true)
        case .exercise3:
            let viewController = LayoutExercise3VC()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            break
        }
    }
}

extension InteractiveListVC: UITableViewDataSource {
    internal func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return routes.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = routes[indexPath.row].rawValue
        return cell
    }
}

